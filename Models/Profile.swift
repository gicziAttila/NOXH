//
//  Profiles.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 07. 06..
//

import Foundation
struct Profile: Identifiable, Codable {
    let id: UUID
    let updatedAt: Date?
    let startingWeight: Double?
    let targetWeight: Double?
    let dailyKcalGoal: Int?
    let dailyProteinGoal: Int?
    let dailyCarbsGoal: Int?
    let dailyFatGoal: Int?
    
    enum CodingKeys: String, CodingKey{
        case id
        case updatedAt = "updated_at"
        case startingWeight = "starting_weight"
        case targetWeight = "target_weight"
        case dailyKcalGoal = "daily_kcal_goal"
        case dailyProteinGoal = "daily_protein_goal"
        case dailyCarbsGoal = "daily_carbs_goal"
        case dailyFatGoal = "daily_fat_goal"
    }
}
