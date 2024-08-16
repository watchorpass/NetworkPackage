
import Foundation

@available(iOS 15.0, *)
public extension URLSession {
    
    func getData(for request: URLRequest) async throws -> (data: Data, response: HTTPURLResponse) {
        let (data, response) = try await data(for: request)
        
        guard let responseHTTP = response as? HTTPURLResponse else {
            throw NetworkError.nonHTTPURLResponse
        }
        
        return (data, responseHTTP)
    }
}
