//
//  CardSelect.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 08. 31..
//

import SwiftUI

struct CardSelect: View {
    var body: some View {
        HStack(spacing: 0) {
            
            VStack(alignment: .leading, spacing: 8) {
                Text("LEAN & DEFINED")
                    .font(.headline)
                    .fontWeight(.bold)
                    .kerning(3)
                    .foregroundStyle(.white)
                
                Text("Aggressive fat loss through a strict calorie deficit. We strip away the excess to reveal a sharp, shredded physique. Your lightest, most defined form.")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Color.clear
                .overlay(
                    Image("leanDefined")
                        .resizable()
                        .scaledToFill()
                )
                .clipped()
                .frame(maxWidth: 150)
        }
        .fixedSize(horizontal: false, vertical: true)
        
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 68/255.0, green: 74/255.0, blue: 79/255.0),
                    Color(red: 5/255.0, green: 5/255.0, blue: 1/255.0)
                ]),
                startPoint: .leading,
                endPoint: UnitPoint(x: 0.55, y: 0.5)
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal, 10)
    }
}
#Preview {
    CardSelect()
}
