//
//  ContentView.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 08. 19..
//

import Foundation
import SwiftUI

struct ContentView: View {
    @State private var activeTab: CustomTab = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            Group {
                switch activeTab {
                case .home:
                    DashboardView()
                case .progress:
                    ProgressView()
                case .aiCoach:
                    AICoachView()
                case .profile:
                    ProfileView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            FloatingTabBar(activeTab: $activeTab)
        }
        .ignoresSafeArea(.keyboard)
        .sensoryFeedback(.selection, trigger: activeTab)
    }
}
