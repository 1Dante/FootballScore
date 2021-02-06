//
//  RestClient.swift
//  FootballScore
//
//  Created by MacBook on 31.01.2021.
//

import Foundation

class RestClient {

    
    var url: URL?

    var request: URLRequest{
        let urls = Urls()
        
       guard let url = url else {preconditionFailure("not right url")}
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = urls.headers
        return request
    }
    
    func fetchData(competionHandler: @escaping ((Data) -> Void)) {
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                preconditionFailure("some error: \(String(describing: error))")
            }
            if let data = data{
               competionHandler(data)
                
            }
        }
        dataTask.resume()
         
    }
    
    
    
    
}
