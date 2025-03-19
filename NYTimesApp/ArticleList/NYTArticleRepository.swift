//
//  NYTArticleRepository.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 16/03/2025.

import Foundation

protocol ArticleRepository {
    func fetchArticles(pathType: PathType, period: Period) async throws -> [Article]
}

//class NYTArticleRepository: ArticleRepository {
//
//    private let networkService: NetworkService
//
//    init(networkService: NetworkServiceProtocol = NetworkService()) { //, apiKey: String) {
//        self.networkService = networkService as! NetworkService
//    }
//
//    func fetchArticles(pathType: PathType, period: Period) async throws -> [Article] {
//        let defaultPath = "https://api.nytimes.com/svc/mostpopular/v2/"
//        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "Api_key") as? String else {
//            throw NetworkError.invalidURL
//        }
//        let urlString = defaultPath + pathType.rawValue + "/\(period.rawValue).json?api-key=\(apiKey)"
//        guard let url = URL(string: urlString) else {
//            throw NetworkError.invalidURL
//        }
//        /// Use the generic network layer to fetch the data
//        let response: NYTResponse = try await networkService.fetchData(url: url)
//        return response.results
//    }
//}

class NYTArticleRepository: ArticleRepository {
    private let networkService: NetworkServiceProtocol  // Use the protocol type

    // Dependency Injection: Use NetworkServiceProtocol instead of concrete NetworkService
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func fetchArticles(pathType: PathType, period: Period) async throws -> [Article] {
        let defaultPath = "https://api.nytimes.com/svc/mostpopular/v2/"
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "Api_key") as? String else {
            throw NetworkError.invalidURL
        }
        let urlString = defaultPath + pathType.rawValue + "/\(period.rawValue).json?api-key=\(apiKey)"
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        // Use the generic network layer to fetch the data
        let response: NYTResponse = try await networkService.fetchData(url: url)
        return response.results
    }
}
