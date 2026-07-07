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
        let projectURL = URL(string: "https://urqakwlirsmvcuayxzsr.supabase.co")!
        let anonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVycWFrd2xpcnNtdmN1YXl4enNyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODMxNjQ0NzksImV4cCI6MjA5ODc0MDQ3OX0.QTUgWW9wJA39AjkyJavlKzHGLL8gWgpXCPAos9mX-rQ"
        self.client = SupabaseClient(supabaseURL: projectURL, supabaseKey: anonKey)
    }
}
