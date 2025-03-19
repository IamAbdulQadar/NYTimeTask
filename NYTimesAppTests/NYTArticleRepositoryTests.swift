//
//  NYTArticleRepositoryTests 2.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 19/03/2025.
//

import XCTest
@testable import NYTimesApp

class NYTArticleRepositoryTests: XCTestCase {
    
    var mockNetworkService: MockNetworkService!
    var repository: NYTArticleRepository!
    
    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()

        /// Inject mock service into the repository
        repository = NYTArticleRepository(networkService: mockNetworkService)

        /// Apply method swizzling before tests (if needed)
        Bundle.swizzleBundleMethod()
    }

    override func tearDown() {
        // Clean up by resetting the API key to nil after each test
        Bundle.setMockApiKey(nil)
        super.tearDown()
    }

    // Test 3: Fetch Articles with Invalid URL
    func testFetchArticlesInvalidURL() async throws {
        // Arrange: Set up an invalid URL in the mock service
        let mockResponse = NYTResponse(results: [Article(url: "http://example.com", id: 1, title: "Mock Title")])
        let mockData = try! JSONEncoder().encode(mockResponse) // Convert mockResponse to Data
        mockNetworkService.dataToReturn = mockData
        
        // Set a valid API Key
        Bundle.setMockApiKey("ValidAPIKey")
        
        // Act: Simulate an invalid URL in the network service
        mockNetworkService.errorToThrow = NetworkError.invalidURL
        
        // Assert: Expecting a NetworkError.invalidURL
        do {
            _ = try await repository.fetchArticles(pathType: .viewed, period: .week)
            XCTFail("Expected NetworkError.invalidURL, but the request succeeded.")
        } catch let error {
            XCTAssertEqual(error as? NetworkError, .invalidURL)
        }
    }
    
    // Test 4: Fetch Articles throws NetworkError.noData
    func testFetchArticlesNoDataError() async throws {
        // Arrange: Set up the mock service to return no data
        mockNetworkService.dataToReturn = nil
        
        // Set a valid API Key
        Bundle.setMockApiKey("ValidAPIKey")
        
        // Act & Assert: Expecting a NetworkError.noData
        do {
            _ = try await repository.fetchArticles(pathType: .viewed, period: .week)
            XCTFail("Expected NetworkError.noData, but the request succeeded.")
        } catch let error {
            XCTAssertEqual(error as? NetworkError, .noData)
        }
    }
    
    // Test 5: Fetch Articles throws NetworkError.serverError
    func testFetchArticlesServerError() async throws {
        // Arrange: Set up a mock network error (server error)
        mockNetworkService.errorToThrow = NetworkError.serverError(statusCode: 500)
        
        // Set a valid API Key
        Bundle.setMockApiKey("ValidAPIKey")
        
        // Act & Assert: Expecting a NetworkError.serverError
        do {
            _ = try await repository.fetchArticles(pathType: .viewed, period: .week)
            XCTFail("Expected NetworkError.serverError, but the request succeeded.")
        } catch let error {
            if case let NetworkError.serverError(statusCode) = error {
                XCTAssertEqual(statusCode, 500)
            } else {
                XCTFail("Expected NetworkError.serverError, but got \(error)")
            }
        }
    }
}
