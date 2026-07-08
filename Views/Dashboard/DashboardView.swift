//
//  DashboardView.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 07. 06..
//

import SwiftUI
import Supabase

struct DashboardView: View {
    @State private var jsonResponseText: String = "Betöltés..."
    @Binding var isAuthenticated: Bool
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView{
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
