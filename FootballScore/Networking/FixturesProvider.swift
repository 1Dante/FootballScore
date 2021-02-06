//
//  FixturesProvider.swift
//  FootballScore
//
//  Created by MacBook on 27.01.2021.
//

import Foundation
struct FixturesProvider{
    
    func fetchJson(completionHandler: @escaping ((Fixture?) -> Void)){
        let urls = Urls()
        let restClinet = RestClient()
        restClinet.url = urls.urlFixtures
        restClinet.fetchData { (data) in
            let decoder = JSONDecoder()
            let json = try? decoder.decode(Fixture.self, from: data)
            completionHandler(json)
        }
    }

    
}
