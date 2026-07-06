//
//  DailyLog.swift
//  NOXH
//
//  Created by Giczi Attila on 2026. 07. 06..
//

import Foundation
struct DailyLog: Identifiable, Codable {
    let id: UUID
    let profileId: UUID
    let date: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case profileId = "profile_id"
        case date
    }
}
