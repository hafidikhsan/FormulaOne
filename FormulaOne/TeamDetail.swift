//
//  TeamDetail.swift
//  FormulaOne
//
//  Created by Hafid Ikhsan Arifin on 10/08/22.
//

import Foundation

struct TeamDetail: Codable {
    let response: [Detail]
    
    enum CodingKeys: String, CodingKey {
        case response = "response"
    }
}
 
struct Detail: Codable {
    let id: Int
    let name: String
    let logo: String
    let base: String
    let first_team_entry: Int
    let world_championships: Int
    let pole_positions: Int
    let fastest_laps: Int
    let president: String
    let director: String
    let technical_manager: String
    let chassis: String
    let engine: String
    let highest_race_finish: Race
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case logo = "logo"
        case base = "base"
        case first_team_entry = "first_team_entry"
        case world_championships = "world_championships"
        case pole_positions = "pole_positions"
        case fastest_laps = "fastest_laps"
        case president = "president"
        case director = "director"
        case technical_manager = "technical_manager"
        case chassis = "chassis"
        case engine = "engine"
        case highest_race_finish = "highest_race_finish"
    }
}

struct Race: Codable {
    let position: Int
    let number: Int
    
    enum CodingKeys: String, CodingKey {
        case position = "position"
        case number = "number"
    }
}
