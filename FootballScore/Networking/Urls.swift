//
//  Urls.swift
//  FootballScore
//
//  Created by MacBook on 29.12.2020.
//

import Foundation

struct Urls {
    let headers = [
        "x-rapidapi-key": "a9c399a6e9mshb97629c27675b80p1b8fb5jsnbe0b1db88306",
        "x-rapidapi-host": "api-football-beta.p.rapidapi.com"
    ]
   // url for standings
    var urlStandings:URL?{
    var urlComponentsStandings = URLComponents()
        urlComponentsStandings.scheme = "https"
        urlComponentsStandings.host = "api-football-beta.p.rapidapi.com"
        urlComponentsStandings.path = "/standings"
        urlComponentsStandings.queryItems = [
            URLQueryItem(name: "season", value: "2020"),
            URLQueryItem(name: "league", value: "39")
        ]
        return urlComponentsStandings.url
    }
   // url for fixtures which not started
    var urlFixtures:URL?{
    var urlComponentsFixtures = URLComponents()
    urlComponentsFixtures.scheme = "https"
    urlComponentsFixtures.host = "api-football-beta.p.rapidapi.com"
    urlComponentsFixtures.path = "/fixtures"
    urlComponentsFixtures.queryItems = [
        URLQueryItem(name: "season", value: "2020"),
        URLQueryItem(name: "league", value: "39"),
        URLQueryItem(name: "status", value: "NS") // not started,
    ]
        return urlComponentsFixtures.url
}
   // url for results
    var urlResults:URL?{
        var urlComponentsResults = URLComponents()
        urlComponentsResults.scheme = "https"
        urlComponentsResults.host = "api-football-beta.p.rapidapi.com"
        urlComponentsResults.path = "/fixtures"
        urlComponentsResults.queryItems = [
            URLQueryItem(name: "season", value: "2020"),
            URLQueryItem(name: "league", value: "39"),
            URLQueryItem(name: "status", value: "FT") // finished
        ]
        return urlComponentsResults.url
    }
    
    var urlToday: URL?{
       
        var urlComponentsDate = URLComponents()
        urlComponentsDate.scheme = "https"
        urlComponentsDate.host = "api-football-beta.p.rapidapi.com"
        urlComponentsDate.path = "/fixtures"
        urlComponentsDate.queryItems = [
            URLQueryItem(name: "date", value: getTodayDate())
        ]
    
        return urlComponentsDate.url
    }
    
    func getTodayDate() -> String{
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let today = dateFormatter.string(from: date)
        return today
    }
    
    
   
}
//Status for matches:
//NS - not started, FT : Match Finished, PST - postponed, HT : Halftime, ET : Extra Time,P : Penalty In Progress,AET : Match Finished After Extra Time
//PEN : Match Finished After Penalty,SUSP : Match Suspended, CANC : Match Cancelled


//TODO: add enum with  ids leagues which user tapped
//TODO: add automaticaly date = Year.

    
    
    
    
    
    
    //url for fixtures
    //var urlPathComponents = URLComponents()
    //urlPathComponents.scheme = "https"
    //urlPathComponents.host = "api-football-beta.p.rapidapi.com"
    //urlPathComponents.path = "/fixtures"
    //urlPathComponents.queryItems = [
    //    URLQueryItem(name: "season", value: "2020"),
    //
   
    //let url = urlPathComponents.url

//

