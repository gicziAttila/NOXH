//
//  FirstLaunchView.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 08. 21..
//

import SwiftUI

struct FirstLaunchView: View {
    var body: some View {
        ZStack {
            Image("welcomeImage")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            
            LinearGradient(
                stops: [
                    .init(color: .clear, location: 0.0),
                    .init(color: Color(red: 0.38, green: 0.47, blue: 0.53).opacity(0.3), location: 0.45),
                    .init(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.75), location: 0.7),
                    .init(color: Color(red: 0.1, green: 0.1, blue: 0.1), location: 1.0)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            VStack(spacing: 24){
                Spacer()
                Image("noxh_logo")
                    .resizable()
                    .frame(width: 90 ,height: 40)
                Text("ready to\nlevel up?")
                    .font(.system(size: 40))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .textCase(.uppercase)
                    .tracking(5)
                    .multilineTextAlignment(.center)
                Text("No more guessing.\nNo more excuses.")
                    .font(.system(size: 20))
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .tracking(5)
                    .multilineTextAlignment(.center)
                Button(action: {
                    //as
                }) {
                    Text("let's start")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .textCase(.uppercase)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(25)
                }
                .padding(.horizontal, 20)
            }
            .padding(.vertical, 80)
        }
        .ignoresSafeArea()
    }
}
#Preview {
    FirstLaunchView()
}
