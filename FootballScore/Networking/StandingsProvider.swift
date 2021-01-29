//
//  StandingsProvider.swift
//  FootballScore
//
//  Created by MacBook on 28.01.2021.
//

import Foundation
struct StandingsProvider: FootballProvider{
   
    
    var url: URL{
        let urls = Urls()
        guard let url = urls.urlStandings else {preconditionFailure("not right url")}
        return url
    }
        
    typealias T = ((Standings?)->Void)
   
    func fetchJSON(completionHandler: @escaping ((Standings?) -> Void)) {
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                preconditionFailure("some problem \(error)")
            }
            if let data = data{
                let decoder = JSONDecoder()
                let json = try? decoder.decode(ResponseStandings.self, from: data)
                json?.response?.forEach({ (league) in
                    league.standings?.forEach({ (standings) in
                        standings.forEach { (standings) in
                            completionHandler(standings)
                        }
                    })
                })
            }
        }
        dataTask.resume()
    }
    
}
