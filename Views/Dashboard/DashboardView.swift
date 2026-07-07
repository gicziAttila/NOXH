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
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView{
                Text(jsonResponseText)
                    .font(.system(.body, design: .monospaced))
                    .foregroundColor(.white)
                    .padding()
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
    DashboardView()
}
