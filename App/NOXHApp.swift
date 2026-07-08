//
//  NOXHApp.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 07. 06..
//

import SwiftUI
import Supabase

@main
struct NOXHApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView()
                .onOpenURL { url in
                    Task {
                        do {
                            try await SupabaseManager.shared.client.auth.session(from: url)
                            print("Bejelentkezve")
                        }catch {
                            print("Hiba a Deep Link feldolgozásakor: \(error.localizedDescription)")
                        }
                    }
                }
        }
    }
}
