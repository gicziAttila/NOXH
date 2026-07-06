//
//  DashboardView.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 07. 06..
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Text("Noxh Dashboard")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    DashboardView()
}
