//
//  RecipeIngredient.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 07. 06..
//

import Foundation
struct RecipeIngredient: Identifiable, Codable {
    let id: UUID
    let recipeId: UUID
    let foodItemId: UUID
    let amountInGrams: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case recipeId = "recipe_id"
        case foodItemId = "food_item_id"
        case amountInGrams = "amount_in_grams"
    }
}
