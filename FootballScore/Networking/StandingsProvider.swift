//
//  StandingsProvider.swift
//  FootballScore
//
//  Created by MacBook on 28.01.2021.
//

import Foundation
struct StandingsProvider{
   
    
    func fetchJson(completionHandler: @escaping (ResponseStandings?) -> Void)  {
        let restClient = RestClient()
        let urls = Urls()
        restClient.url = urls.urlStandings
        restClient.fetchData { (data) in
            let decoder = JSONDecoder()
            let json = try? decoder.decode(ResponseStandings.self, from: data)
            completionHandler(json)
        }
       
    }
}
