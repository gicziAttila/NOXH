//
//  NameStepView.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 08. 30..
//
import SwiftUI

struct NameStepView: View {
    @Binding var userName: String
    var onNext: () -> Void
    var body: some View {
        VStack(spacing: 32) {
            Text("What Should We Call You?")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .kerning(5)
                .multilineTextAlignment(.center)
            TextField("Enter your name", text: $userName)
                .padding()
                .background(.gray)
                .cornerRadius(12)
                .foregroundStyle(.white)
                .tint(.green)
                .padding(.horizontal, 40)
                .padding(.vertical, 20)
            Button(action: {
                onNext()
            }, label: {
                Text("next")
                    .font(.headline)
                    .textCase(.uppercase)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.green)
                    .cornerRadius(12)
            })
        }
    }
}
