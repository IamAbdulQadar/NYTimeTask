//
//  NetworkLayer.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 18/03/2025.
//

import Foundation

// Define possible network errors
enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingFailed
    case serverError(statusCode: Int)
    case unknown(Error)
}

// Protocol for network service
protocol NetworkServiceProtocol {
    func fetchData<T: Decodable>(url: URL) async throws -> T
}

// Default implementation of NetworkServiceProtocol
class NetworkService: NetworkServiceProtocol {

    func fetchData<T: Decodable>(url: URL) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)

        // Handle server errors
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.serverError(statusCode: 0)
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.serverError(statusCode: httpResponse.statusCode)
        }
        
        // Handle no data
        guard !data.isEmpty else {
            throw NetworkError.noData
        }

        // Decode data
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}

extension NetworkError: Equatable {
    static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidURL, .invalidURL):
            return true
        case (.noData, .noData):
            return true
        case (.decodingFailed, .decodingFailed):
            return true
        case (.serverError(let lhsStatusCode), .serverError(let rhsStatusCode)):
            return lhsStatusCode == rhsStatusCode
        case (.unknown(let lhsError), .unknown(let rhsError)):
            return (lhsError.localizedDescription == rhsError.localizedDescription)
        default:
            return false
        }
    }
}
