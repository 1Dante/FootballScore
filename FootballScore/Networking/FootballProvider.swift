//
//  FetchJson.swift
//  FootballScore
//
//  Created by MacBook on 27.01.2021.
//

import Foundation

protocol FootballProvider{
    
   //var request: URLRequest { get set }
    var url: URL { get }
    associatedtype T
    func fetchJSON(completionHandler: T)
}

extension FootballProvider{
    
    var request: URLRequest{
        let header = Urls()
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = header.headers
        return request
    }

}

