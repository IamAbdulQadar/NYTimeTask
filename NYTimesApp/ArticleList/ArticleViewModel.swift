//
//  ArticleViewModel.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 16/03/2025.

import SwiftUI

@MainActor
class ArticleViewModel: ObservableObject {

    @Published private(set) var articles: [Article] = []
    @Published private(set) var errorMessage: String?
    @Published private(set) var isLoading: Bool = false
    private let repository: ArticleRepository

    init(repository: ArticleRepository) {
        self.repository = repository
    }

    func loadArticles(pathType: PathType, period: Period) async {
        isLoading = true
        errorMessage = nil
        do {
            let fetchedArticles = try await repository.fetchArticles(pathType: pathType, period: period)
            articles = fetchedArticles
        } catch let networkError as NetworkError {
            /// Use the centralized error handler
            errorMessage = ErrorHandler.handleNetworkError(networkError)
        } catch {
            errorMessage = "An unexpected error occurred: \(error.localizedDescription)"
        }
        isLoading = false
    }
}
