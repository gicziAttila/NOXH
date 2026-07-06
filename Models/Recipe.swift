//
//  Recipe.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 07. 06..
//

import Foundation
struct Recipe: Identifiable, Codable{
    let id: UUID
    let name: String
    let profileId: UUID
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case profileId = "profile_id"
    }
}
