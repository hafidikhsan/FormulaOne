import Foundation

struct FOneAPI: Codable {
    let response: [Teams]
    let results: Int
    
    enum CodingKeys: String, CodingKey {
        case response = "response"
        case results = "results"
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
