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
   
}



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
    ////URLQueryItem(name: "league", value: "39"), //england EPL
    ////URLQueryItem(name: "league", value: "140"), //spain primera
    ////URLQueryItem(name: "league", value: "135"), //italy seria A
    ////URLQueryItem(name: "league", value: "78"), //Germany bundesliga
    //
    ////URLQueryItem(name: "live", value: "all"),
    //URLQueryItem(name: "date", value: "2020-12-28")
    //]
    //let url = urlPathComponents.url

//

