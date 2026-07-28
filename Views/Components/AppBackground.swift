//
//  AppBackground.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 07. 28..
//

import SwiftUI

struct AppBackground: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 38/255.0, green: 47/255.0, blue: 53/255.0),
                Color(red: 10/255.0, green: 10/255.0, blue: 10/255.0)
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}
