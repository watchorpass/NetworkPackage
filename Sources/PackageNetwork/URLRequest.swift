//
//  File.swift
//  
//
//  Created by Alex  on 10/8/24.
//

import Foundation

//porque hay que poner public extension?
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

//let url = URL(string: "https://api.themoviedb.org/3/discover/movie")!
//var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
//let queryItems: [URLQueryItem] = [
//    URLQueryItem(name: "include_adult", value: "false"),
//    URLQueryItem(name: "include_video", value: "false"),
//    URLQueryItem(name: "language", value: "en-US"),
//    URLQueryItem(name: "page", value: "1"),
//    URLQueryItem(name: "sort_by", value: "popularity.desc"),
//]
//components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
//
//var request = URLRequest(url: components.url!)
//request.httpMethod = "GET"
//request.timeoutInterval = 10
//request.allHTTPHeaderFields = [
//    "accept": "application/json",
//    "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiYTg2ZmY0ZGM2ZDgzOWE3NDUwYTljMTRkNDgwMWQ2NiIsIm5iZiI6MTcyMzMwMjY5OS44MDYzNTEsInN1YiI6IjY2MjdlMDEzNjJmMzM1MDE0YmQ4NGY0OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.LaOc3q6xEikDpl1BnCkVjg_bXCNAhMt4vPc9gJlk72Q"
//]
//
//let (data, _) = try await URLSession.shared.data(for: request)
//print(String(decoding: data, as: UTF8.self))
