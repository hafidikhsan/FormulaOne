//
//  TeamsListModel.swift
//  FormulaOne
//
//  Created by Hafid Ikhsan Arifin on 08/08/22.
//

import Foundation

struct FOneAPI: Codable {
    let response: [Teams]
    
    enum CodingKeys: String, CodingKey {
        case response = "response"
    }
}
 
struct Teams: Codable {
    let position: Double
    let points: Int
    let season: Double
    let team: Team
    
    enum CodingKeys: String, CodingKey {
        case position = "position"
        case points = "points"
        case season = "season"
        case team = "team"
    }
}

struct Team: Codable {
    let id: Double
    let name: String
    let logo: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case logo = "logo"
    }
}
