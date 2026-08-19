//
//  SupabaseManager.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 07. 07..
//

import Foundation
import Supabase

final class SupabaseManager {
    static let shared = SupabaseManager()
    let client: SupabaseClient
    private init() {
        let projectURL = env.supabaseURL
        let anonKey = env.supabaseAnonKey
        self.client = SupabaseClient(supabaseURL: projectURL, supabaseKey: anonKey)
    }
    private func todayString() -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            return formatter.string(from: Date())
        }
    func fetchProfile(userID: UUID) async throws -> Profile {
        let profile: Profile = try await client
            .from("profiles")
            .select()
            .eq("id", value: userID.uuidString)
            .single()
            .execute()
            .value
        return profile
    }
}
