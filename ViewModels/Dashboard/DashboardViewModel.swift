//
//  DashboardViewModel.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 07. 28..
//

import SwiftUI
import Foundation
import Combine

@MainActor
class DashboardViewModel: ObservableObject {
    @Published var selectedDate: Date = Date()
    
    @Published var targetKcal: Int? = 0
    @Published var targetProtein: Int? = 0
    @Published var targetCarbs: Int? = 0
    @Published var targetFat: Int? = 0
    
    @Published var consumedKcal: Int = 0
    @Published var consumedProtein: Double = 0
    @Published var consumedCarbs: Double = 0
    @Published var consumedFat: Double = 0
    
    @Published var isLoading: Bool = false
    
    // TODO: Auth bevezetésekor ezt dinamikusan kérjük le a bejelentkezett felhasználótól
    // Egyelőre másold be ide a saját profilod UUID-ját a Supabase 'profiles' táblájából!
    let currentUserId = UUID(uuidString: "IDE_MASOLD_A_PROFILOD_ID_JAT")!
    
    var displayedDateText: String {
        if Calendar.current.isDateInToday(selectedDate) {
            return "TODAY"
        } else {
            return selectedDate.formatted(
                .dateTime
                    .month(.abbreviated)
                    .day()
                    .locale(Locale(identifier: "en_US"))
            ).uppercased() + "."
        }
    }
    func changeDate(by days: Int) {
        if let newDate = Calendar.current.date(byAdding: .day, value: days, to: selectedDate) {
            selectedDate = newDate
            Task {
                await fetchDataForSelectedDate()
            }
        }
    }
    private func fetchDataForSelectedDate() async {
        isLoading = true
        defer { isLoading = false }
        do {
            if targetKcal == 0 {
                let profile = try await SupabaseManager.shared.fetchProfile(userID: currentUserId)
                self.targetKcal = profile.dailyKcalGoal
                self.targetProtein = profile.dailyProteinGoal
                self.targetCarbs = profile.dailyCarbsGoal
                self.targetFat = profile.dailyFatGoal
            }
            self.consumedKcal = 0
            self.consumedProtein = 0
            self.consumedCarbs = 0
            self.consumedFat = 0
            
            // 3. Mai napló lekérése (Ez már a "Jancsika-álló", lusta olvasás!)
            if let dailyLog = try await SupabaseManager.shared.fetchDailyLog(for: selectedDate, profileId: currentUserId) {
                
                // 4. Ha van napló, lekérjük a konkrét étkezéseket
                let entries = try await SupabaseManager.shared.fetchLogEntries(for: dailyLog.id)
                
                // 5. Összeadjuk a megevett makrókat
                for entry in entries {
                    self.consumedKcal += entry.snapshotKcal
                    self.consumedProtein += entry.snapshotProtein
                    self.consumedCarbs += entry.snapshotCarbs
                    self.consumedFat += entry.snapshotFat
                }
            }
        } catch {
            print("Hiba az adatok lekérdezésekor: \(error.localizedDescription)")
        }
    }
}
