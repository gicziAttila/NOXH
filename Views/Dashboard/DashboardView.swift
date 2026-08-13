//
//  DashboardView.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 07. 06..
//

import SwiftUI
import Supabase
struct DashboardView: View {
    @StateObject private var viewModel = DashboardViewModel()
    @State private var jsonResponseText: String = "Betöltés..."
    @Binding var isAuthenticated: Bool
    var body: some View {
        ZStack {
            AppBackground()
            VStack(spacing: 24){
                ScrollView{
                    DateSelectView(viewModel: viewModel)
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                    MacroCircleView(title: "calories", progress: 0.6, color: .green, innerValue: "420", innerSubText: "kcal left", size: .main)
                        .frame(width: 180, height: 180)
                    HStack(spacing: 1){
                        MacroCircleView(title: "protein", progress: 1, color: .blue, innerValue: "100", innerSubText: "gram over")
                            .frame(width: 130, height: 130)
                        MacroCircleView(title: "carbs", progress: 0.9, color: .yellow, innerValue: "10", innerSubText: "gram left")
                            .frame(width: 130, height: 130)
                        MacroCircleView(title: "fat", progress: 0.6, color: .red, innerValue: "40", innerSubText: "gram left")
                            .frame(width: 130, height: 130)
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    VStack(alignment: .leading){
                        Text("ai insight")
                            .fontWeight(.bold)
                            .textCase(.uppercase)
                            .foregroundColor(.white)
                            .padding(.bottom, 5)
                        Text("Good day so far keep it up! You still have 400kcal left and you finished your protein goal. Because of this you can have a sweet treat")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(red: 38/255.0, green: 47/255.0, blue: 53/255.0))
                    .cornerRadius(16)
                    .padding(.horizontal, 20)
                    VStack(alignment: .leading){
                        Text("today's meals")
                            .fontWeight(.bold)
                            .textCase(.uppercase)
                            .foregroundColor(.white)
                        MealCardView(title: "breakfast", calories: 500, iconName: "cup.and.saucer.fill")
                        MealCardView(title: "breakfast", calories: 500, iconName: "cup.and.saucer.fill")
                        MealCardView(title: "breakfast", calories: 500, iconName: "cup.and.saucer.fill")
                        MealCardView(title: "breakfast", calories: 500, iconName: "cup.and.saucer.fill")
                        MealCardView(title: "breakfast", calories: 500, iconName: "cup.and.saucer.fill")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    Text(jsonResponseText)
                        .font(.system(.body, design: .monospaced))
                        .foregroundColor(.white)
                        .padding()
                    Button(action: {
                        Task {
                            do {
                                try await SupabaseManager.shared.client.auth.signOut()
                                print("Sikeres kijelentkezés!")
                                await MainActor.run {
                                    isAuthenticated = false
                                }
                            } catch {
                                print("Hiba a kijelentkezéskor: \(error.localizedDescription)")
                            }
                        }
                    }) {
                        Text("LOG OUT")
                            .foregroundColor(.red)
                            .bold()
                    }
                }
            }
        }
        .task {
            do {
                let foodItems: [FoodItem] = try await SupabaseManager.shared.client
                    .from("food_items")
                    .select()
                    .execute()
                    .value
                self.jsonResponseText = String(describing: foodItems)
            }
            catch {
                self.jsonResponseText = "Hiba történt: \(error.localizedDescription)"
            }
        }
    }
}

#Preview {
    DashboardView(isAuthenticated: .constant(true))
}
