//
//  Fixture.swift
//  FootballScore
//
//  Created by MacBook on 15.01.2021.
//

import Foundation

struct Fixture: Decodable{
    var response:  [Fixtures]?
    
    enum CodingKeys: String,CodingKey{
        case response
    }
    
    init(from decoder: Decoder) throws {
        let conteiner = try decoder.container(keyedBy: CodingKeys.self)
        self.response = try conteiner.decode([Fixtures].self, forKey: .response)
    }
    
}

struct Fixtures: Decodable{
    
      var id: Int
      var timezone: String
      var date: String
    
      var homeTeamName: String
      var awayTeamName: String
      var homeTeamLogo: String
      var awayTeamLogo: String
      var goalsHomeTeam: Int?
      var goalsAwayTeam: Int?
   
    enum CodingKeys: String, CodingKey{
        case teams
        case goals
        case fixture
        case homeTeam = "home"
        case awayTeam = "away"
        case teamName = "name"
        case logo = "logo"
        case id = "id"
        case timezone = "timezone"
        case date = "date"
    }
    
    init(from decoder: Decoder) throws {
        let conteiner = try decoder.container(keyedBy: CodingKeys.self)
        
        let fixtureNestedContainer = try conteiner.nestedContainer(keyedBy: CodingKeys.self, forKey: .fixture)
        
        self.id = try fixtureNestedContainer.decode(Int.self, forKey: .id)
        self.timezone = try fixtureNestedContainer.decode(String.self, forKey: .timezone)
        self.date = try fixtureNestedContainer.decode(String.self, forKey: .date)
        
        let teamsNestedConteiner = try conteiner.nestedContainer(keyedBy: CodingKeys.self, forKey: .teams)
        
        let homeNestedConteiner = try teamsNestedConteiner.nestedContainer(keyedBy: CodingKeys.self, forKey: .homeTeam)
        self.homeTeamName = try homeNestedConteiner.decode(String.self, forKey: .teamName)
        self.homeTeamLogo = try homeNestedConteiner.decode(String.self, forKey: .logo)
        
        let awayNestedConteiner = try teamsNestedConteiner.nestedContainer(keyedBy: CodingKeys.self, forKey: .awayTeam)
        self.awayTeamName = try awayNestedConteiner.decode(String.self, forKey: .teamName)
        self.awayTeamLogo = try awayNestedConteiner.decode(String.self, forKey: .logo)
       
        let goalsNestedConteiner = try conteiner.nestedContainer(keyedBy: CodingKeys.self, forKey: .goals)
        self.goalsHomeTeam = try? goalsNestedConteiner.decode(Int.self, forKey: .homeTeam)
        self.goalsAwayTeam = try? goalsNestedConteiner.decode(Int.self, forKey: .awayTeam)
    }
    
}

