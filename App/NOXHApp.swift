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
    @State private var isLoading: Bool = true
    @State private var isAuthenticated: Bool = false
    var body: some Scene {
        WindowGroup {
            Group {
                if isLoading {
                    LoadingView()
                }
                else if isAuthenticated {
                    ContentView()
                }
                else{
                    LoginView()
                }
            }
            .onOpenURL { url in
                Task {
                    do {
                        try await SupabaseManager.shared.client.auth.session(from: url)
                        print("Bejelentkezve")
                        await MainActor.run {
                            isAuthenticated = true
                        }
                    }catch {
                        print("Hiba a Deep Link feldolgozásakor: \(error.localizedDescription)")
                    }
                }
            }
            .task {
                do {
                    _ = try await SupabaseManager.shared.client.auth.session
                    await MainActor.run {
                        isAuthenticated = true
                        isLoading = false
                    }
                } catch {
                    await MainActor.run {
                        isAuthenticated = false
                        isLoading = false
                    }
                }
            }
        }
    }
}  
