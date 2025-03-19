//
//  MockNetworkService.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 19/03/2025.
//

import XCTest
@testable import NYTimesApp

// Mock NetworkService
class MockNetworkService: NetworkServiceProtocol {
    var dataToReturn: Data?
    var errorToThrow: Error?

    // Conform to NetworkServiceProtocol
    func fetchData<T: Decodable>(url: URL) async throws -> T {
        if let error = errorToThrow {
            throw error
        }
        
        guard let data = dataToReturn else {
            throw NetworkError.noData
        }
        
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    }
}
