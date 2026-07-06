//
//  LogEntry.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 07. 06..
//

import Foundation
enum MealType: String, Codable {
    case breakfast = "BREAKFAST"
    case lunch = "LUNCH"
    case snack = "SNACK"
    case dinner = "DINNER"
}
struct LogEntry: Identifiable, Codable {
    let id: UUID
    let dailyLogId: UUID
    let foodItemId: UUID?
    let mealType: MealType
    let recipeId: UUID?
    let amountInGrams: Double
    let snapshotKcal: Int
    let snapshotProtein: Double
    let snapshotCarbs: Double
    let snapshotFat: Double
    let createdAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case dailyLogId = "daily_log_id"
        case foodItemId = "food_item_id"
        case mealType = "meal_type"
        case recipeId = "recipe_id"
        case amountInGrams = "amount_in_grams"
        case snapshotKcal = "snapshot_kcal"
        case snapshotProtein = "snapshot_protein"
        case snapshotCarbs = "snapshot_carbs"
        case snapshotFat = "snapshot_fat"
        case createdAt = "created_at"
    }
}
