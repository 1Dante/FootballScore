//
//  ResultsProvider.swift
//  FootballScore
//
//  Created by MacBook on 28.01.2021.
//

import Foundation

struct ResultsProvider{

     //The same model like for Standings, only different status for url : FT - finished
    func fetchJson(completionHandler: @escaping ((Fixture?) -> Void)){
        let urls = Urls()
        let restClinet = RestClient()
        restClinet.url = urls.urlResults
        restClinet.fetchData { (data) in
            let decoder = JSONDecoder()
            let json = try? decoder.decode(Fixture.self, from: data)
            completionHandler(json)
        }
    }
    
    
}
