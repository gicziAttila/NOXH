//
//  LoadingView.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 08. 12..
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            AppBackground()
            VStack{
                Image("noxh_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 90)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LoadingView()
}
