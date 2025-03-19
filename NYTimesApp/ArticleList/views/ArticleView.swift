//
//  ArticleView.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 16/03/2025.

import SwiftUI

// Main List View
struct ArticleView: View {

    @StateObject private var viewModel: ArticleViewModel
    @State private var pathType: PathType = .viewed
    @State private var period: Period = .week

    init(repository: ArticleRepository) {
        _viewModel = StateObject(wrappedValue: ArticleViewModel(repository: repository))
    }

    var body: some View {
        NavigationStack {
            ArticleContentView(
                viewModel: viewModel,
                pathType: $pathType,
                period: $period
            )
            .navigationTitle("Most \(pathType.title()) Articles")
        }
    }
}
