//
//  MacroCircleView.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 07. 28..
//

import Foundation
import SwiftUI
enum MacroCircleSize {
    case main
    case secondary
}
struct MacroCircleView: View {
    let title: String
    let progress: Double
    let color: Color
    let innerValue: String
    let innerSubText: String
    var size: MacroCircleSize = .secondary
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                    .opacity(0.3)
                    .foregroundColor(color)
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: size == .main ? 12 : 6, lineCap: .round))
                    .foregroundColor(color)
                    .rotationEffect(Angle(degrees: -90))
                    .animation(.easeInOut(duration: 1.0), value: progress)
                VStack(spacing: size == .main ? 2 : 0) {
                    Text(innerValue)
                        .font(size == .main ? .title : .title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.3)
                    Text(innerSubText)
                        .font(.system(size: size == .main ? 10 : 9))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .textCase(.uppercase)
                        .lineLimit(1)
                        .minimumScaleFactor(0.3)
                }
            }
            .padding(5)
            Spacer()
            Text(title)
                .font(size == .main ? .title2 : .headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .textCase(.uppercase)
        }
    }
}
