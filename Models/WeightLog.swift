//
//  WeightLog.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 07. 06..
//

import Foundation
struct WeightLog: Identifiable, Codable {
    let id: UUID
    let profileId: UUID
    let date: Date
    let weight: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case profileId = "profile_id"
        case date
        case weight
    }
}
