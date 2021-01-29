//
//  ResultsProvider.swift
//  FootballScore
//
//  Created by MacBook on 28.01.2021.
//

import Foundation

struct ResultsProvider: FootballProvider{

     //The same model like for Standings, only different status for url : FT - finished
    var url: URL{
        let urls = Urls()
        guard let url = urls.urlResults else {preconditionFailure("not right url") }
        return url
    }
    typealias T = (Fixtures?)->Void
    
    func fetchJSON(completionHandler: @escaping (Fixtures?) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                preconditionFailure("some problem")
                
            }
            if response != nil {
                //  print(response)
        }
            if let data = data{
                let decoder = JSONDecoder()
              
                let json = try? decoder.decode(Fixture.self, from: data)
                json?.response?.forEach({ (fixtures) in
                   completionHandler(fixtures)
                })
            }
}
        dataTask.resume()
    }
    
    
}
