//
//  ArticleContentView.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 16/03/2025.

import SwiftUI

struct ArticleContentView: View {

    @ObservedObject var viewModel: ArticleViewModel
    @Binding var pathType: PathType
    @Binding var period: Period

    var body: some View {
        VStack {
            if viewModel.isLoading {
                LoadingView()
            } else if !viewModel.articles.isEmpty {
                ArticleListView(articles: viewModel.articles)
            } else if let errorMessage = viewModel.errorMessage {
                ErrorView(errorMessage: errorMessage)
            } else {
                Text("No articles available")
                    .foregroundColor(.gray)
            }
        }
        .toolbar {
            PeriodSelector(period: $period)
            PathTypeSelector(pathType: $pathType)
        }
        .task(id: pathType) {
            await viewModel.loadArticles(pathType: pathType, period: period)
        }
        .task(id: period) {
            await viewModel.loadArticles(pathType: pathType, period: period)
        }
    }
}
