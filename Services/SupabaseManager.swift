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
    private func dateString(from date: Date) -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            return formatter.string(from: date)
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
    func fetchDailyLog(for date: Date, profileId: UUID) async throws -> DailyLog? {
            let targetDate = dateString(from: date)
            
            do {
                let existingLog: DailyLog = try await client
                    .from("daily_log")
                    .select()
                    .eq("profile_id", value: profileId.uuidString)
                    .eq("date", value: targetDate)
                    .single()
                    .execute()
                    .value
                
                return existingLog
                
            } catch {
                return nil
            }
        }
        func ensureDailyLogExists(for date: Date, profileId: UUID) async throws -> DailyLog {
            if let existingLog = try await fetchDailyLog(for: date, profileId: profileId) {
                return existingLog
            }
            
            let newLog = DailyLog(id: UUID(), profileId: profileId, date: date)
            
            let createdLog: DailyLog = try await client
                .from("daily_log")
                .insert(newLog)
                .select()
                .single()
                .execute()
                .value
            
            return createdLog
        }
    func fetchLogEntries(for dailyLogId: UUID) async throws -> [LogEntry] {
        let entries: [LogEntry] = try await client
            .from("log_entries")
            .select()
            .eq("daily_log_id", value: dailyLogId.uuidString)
            .execute()
            .value
        return entries
    }
}
