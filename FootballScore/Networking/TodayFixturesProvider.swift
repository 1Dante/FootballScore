//
//  TodayFixturesProvider.swift
//  FootballScore
//
//  Created by MacBook on 30.01.2021.
//

import Foundation

struct TodayFixturesProvider{
   
    func fetchJson(completionHandler: @escaping (Fixture?)->Void){
        let urls = Urls()
        let restClient = RestClient()
        restClient.url = urls.urlToday
        restClient.fetchData { (data) in
            let decoder = JSONDecoder()
            let json = try? decoder.decode(Fixture.self, from: data)
            completionHandler(json)
        }
    }
    
}
