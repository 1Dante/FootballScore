//
//  Standings.swift
//  FootballScore
//
//  Created by MacBook on 29.12.2020.
//

import Foundation


struct ResponseStandings: Decodable {
    var response: [Leagues]?
    
    enum CodingKeys: String, CodingKey{
        case response
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.response = try container.decode([Leagues].self, forKey: .response)
    }
    
}

struct Leagues: Decodable{
    var name = ""
    var country = ""
    var standings: [[Standings]]?

    enum CodingKeys: String, CodingKey{
        case league
        case standings
        
        case name
        case country
       
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let nestedContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .league)
        self.name = try nestedContainer.decode(String.self, forKey: .name)
        self.country = try nestedContainer.decode(String.self, forKey: .country)
        self.standings = try nestedContainer.decode([[Standings]].self, forKey: .standings)
    }
    
    
}


struct Standings: Decodable{

      var rank: Int
      var points: Int
      var description: String?
    var teamName = ""
    var played: Int
    var win: Int
    var draw: Int
    var lose: Int
    var goalsFor: Int
    var goalsAgainst: Int
    
    
    private enum CodingKeys: String, CodingKey{
    
        case all
        case goals
        case team
       
        case rank
        case points
        case description
        case teamName = "name"
        case played
        case win
        case draw
        case lose
        case goalsFor = "for"
        case goalsAgainst = "against"
    }
    

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        rank.self = try container.decode(Int.self, forKey: .rank)
        points.self = try container.decode(Int.self, forKey: .points)
        description.self = try? container.decode(String.self, forKey: .description)
        
        let teamNestedContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .team)
        self.teamName = try teamNestedContainer.decode(String.self, forKey: .teamName)

        let allNestedContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .all)
        self.played = try allNestedContainer.decode(Int.self, forKey: .played)
        self.win = try allNestedContainer.decode(Int.self, forKey: .win)
        self.draw = try allNestedContainer.decode(Int.self, forKey: .draw)
        self.lose = try allNestedContainer.decode(Int.self, forKey: .lose)

        let goalsNestedContainer = try allNestedContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .goals)
        self.goalsFor = try goalsNestedContainer.decode(Int.self, forKey: .goalsFor)
        self.goalsAgainst = try goalsNestedContainer.decode(Int.self, forKey: .goalsAgainst)
    }
   // var response: [Response]?
    
}
//struct Standings: Decodable{
//    var response: [Response]?
//}
//
//struct Response: Decodable{
//    var league: League?
//}
//
//struct League: Decodable{
//    var name: String
//    var country: String
//    var standings: [[Table]]?
//}
//
//struct Table: Decodable{
//    var rank: Int
//    var points: Int
//    var description: String?
//    var team: Team
//    var all: All
//}
//
//struct Team: Decodable{
//    var name: String
//}
//
//struct All: Decodable{
//    var played: Int
//    var win: Int
//    var draw: Int
//    var lose: Int
//    var goals: Goals
//}
//
//struct Goals: Decodable{
//    var fors: Int
//    var against: Int
//
//    private enum CodingKeys: String, CodingKey{
//        case fors = "for"
//        case against = "against"
//    }
//}
