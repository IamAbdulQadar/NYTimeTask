//
//  NetworkServiceTests.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 19/03/2025.
//

import XCTest
@testable import NYTimesApp

class NetworkServiceTests: XCTestCase {
    
    var networkService: NetworkService!
    
    override func setUp() {
        super.setUp()
        networkService = NetworkService()
    }

    override func tearDown() {
        networkService = nil
        super.tearDown()
    }
    
    func testFetchDataSuccess() async {
        // Given
        let url = URL(string: "https://example.com")!
        _ = NYTResponse(results: [Article(id: 1, title: "Test Article")])
        
        // Mock URLSession or use a stubbed response to return `mockResponse` here
        
        // When
        do {
            let response: NYTResponse = try await networkService.fetchData(url: url)
            // Then
            XCTAssertEqual(response.results.first?.title, "Test Article")
        } catch {
            XCTFail("Expected success, but got error: \(error)")
        }
    }
    
//    func testFetchDataFailure() async {
//        // Given
//        let url = URL(string: "https://invalid-url.com")!
//        // When
//        do {
//            _ = try await networkService.fetchData(url: url)
//            XCTFail("Expected failure, but got success")
//        } catch let error as NetworkError {
//            // Then
//            XCTAssertTrue(error is NetworkError, "Expected NetworkError, but got \(error)")
//        } catch {
//            XCTFail("Unexpected error: \(error)")
//        }
//    }
}
