//
//  File.swift
//  
//
//  Created by Alex  on 10/8/24.
//

import Foundation

@available(iOS 13.0.0, *)
public protocol NetworkInteractor {
    func getJSONFromURL<T>(request: URLRequest, type: T.Type) async throws -> T where T:Codable
}

@available(iOS 15.0, *)
public extension NetworkInteractor {
    func getJSONFromURL<T>(request: URLRequest, type: T.Type) async throws -> T where T:Codable {
        let (data, responseHTTP) = try await URLSession.shared.getData(for: request)
        
        guard responseHTTP.statusCode == 200 else {
            throw NetworkError.badStatusCode(responseHTTP.statusCode)
        }
        
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            throw NetworkError.JSONDecoderError(error)
        }
        
    }
}
