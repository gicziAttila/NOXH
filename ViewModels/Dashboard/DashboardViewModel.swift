//
//  DashboardViewModel.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 07. 28..
//

import SwiftUI
import Foundation
import Combine

class DashboardViewModel: ObservableObject {
    @Published var selectedDate: Date = Date()
    
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
            fetchDataForSelectedDate()
        }
    }
    private func fetchDataForSelectedDate() {
        // TODO: Backend
    }
}
