//
//  File.swift
//  
//
//  Created by Alex  on 10/8/24.
//

import Foundation


public extension URLRequest {
    
    @available(iOS 16.0, *)
    static func get(url: URL, token: String? = nil) async throws -> URLRequest {
        
        var request = URLRequest(url: url)
        let headers = [
            "accept": "application/json",
            "Authorization": "Bearer " + (token ?? "No token")
        ]

        request.timeoutInterval = 30
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        
        return request
    }
}

