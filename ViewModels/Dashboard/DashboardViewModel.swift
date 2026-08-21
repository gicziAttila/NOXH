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
                //await fetchDataForSelectedDate()
            }
        }
    }
}
