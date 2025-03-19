//
//  MockArticleRepository.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 19/03/2025.
//

import XCTest
@testable import NYTimesApp

// Mock Repository
class MockArticleRepository: NYTArticleRepository {
    
    var stubbedArticles: [Article] = []
    var shouldFail = false
    
    override func fetchArticles(pathType: PathType, period: Period) async throws -> [Article] {
        if shouldFail {
            throw NetworkError.unknown(NSError(domain: "", code: 0, userInfo: nil))
        }
        return stubbedArticles
    }
}
