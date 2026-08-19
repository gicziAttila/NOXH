//
//  FloatingTabBar.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 08. 17..
//

import SwiftUI

enum CustomTab: String, CaseIterable {
    case home = "Home"
    case progress = "Progress"
    case aiCoach = "AI Coach"
    case profile = "Profile"
    
    var icon: String {
        switch self {
        case .home: return "house.fill"
        case .progress: return "chart.xyaxis.line"
        case .aiCoach: return "siri"
        case .profile: return "person.fill"
        }
    }
    var index: Int {
        Self.allCases.firstIndex(of: self) ?? 0
    }
}

struct FloatingTabBar: View {
    @Binding var activeTab: CustomTab
    var body: some View {
        VStack {
            GlassEffectContainer(spacing: 10) {
                HStack(spacing: 10) {
                    GeometryReader {
                        CustomTabBar(size: $0.size, activeTab: $activeTab) { tab in
                            VStack(spacing: 3) {
                                Image(systemName: tab.icon)
                                    .font(.title3)
                                Text(tab.rawValue)
                                    .font(.system(size: 10))
                                    .fontWeight(.bold)
                            }
                            .symbolVariant(.fill)
                            .frame(maxWidth: .infinity)
                        }
                        .glassEffect(.regular.interactive(), in: .capsule)
                    }
                    
                    ZStack {
                        Image(systemName: "plus")
                            .font(.system(size: 22, weight: .bold))
                    }
                    .frame(width: 55, height: 55)
                    .glassEffect(.regular.interactive(), in: .capsule)
                    .animation(.smooth(duration: 0.55, extraBounce: 0), value: activeTab)
                }
            }
            .frame(height: 55)
        }
        .padding(.horizontal, 20)
    }
    
}

extension View {
    @ViewBuilder
    func blurFade(_ status: Bool) -> some View {
        self
            .compositingGroup()
            .blur(radius: status ? 0 : 10)
            .opacity(status ? 1 : 0)
    }
}
#Preview {
    FloatingTabBar(activeTab: .constant(.home))
}

