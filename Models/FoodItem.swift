//
//  FoodItems.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 07. 06..
//

import Foundation
struct FoodItem: Identifiable, Codable {
    let id: UUID
    let createdAt: Date
    let name: String
    let barcode: String?
    let kcalPer100g: Double
    let proteinPer100g: Double
    let carbsPer100g: Double
    let fatPer100g: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case name
        case barcode
        case kcalPer100g = "kcal_per_100g"
        case proteinPer100g = "protein_per_100g"
        case carbsPer100g = "carbs_per_100g"
        case fatPer100g = "fat_per_100g"
    }
}
