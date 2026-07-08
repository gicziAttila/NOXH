//
//  LoginView.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 07. 07..
//

import SwiftUI

struct LoginView: View {
    private let bgColorStart = Color(red: 38/255.0, green: 47/255.0, blue: 53/255.0)
    private let bgColorEnd = Color(red: 10/255.0, green: 10/255.0, blue: 10/255.0)
    @State private var email: String = ""
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [bgColorStart, bgColorEnd]), startPoint: .top, endPoint: .bottom)
        .edgesIgnoringSafeArea(.all)
            VStack{
                Image("noxh_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                Spacer()
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("email address").kerning(4)
                    .textCase(.uppercase)
                    .foregroundColor(.white)
                    .bold()
                TextField("", text: $email)
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                Button(action: {
                    print("lorem ipsum")
                }) {
                    Text("log in")
                        .font(.headline)
                        .fontWeight(.bold)
                        .textCase(.uppercase)
                        .foregroundColor(email.isEmpty ? .green : .black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(email.isEmpty ? Color.clear : Color.green)
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.green, lineWidth: email.isEmpty ? 2 : 0)
                        )
                }
                .padding(.horizontal, 24)
                .padding(.top, 20)
                .animation(.easeInOut(duration: 0.3), value: email.isEmpty)
            }
            .padding(.horizontal, 24)
            }
        }
    }

#Preview {
    LoginView()
}
