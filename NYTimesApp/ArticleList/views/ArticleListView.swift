//
//  ArticleListView.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 16/03/2025.

import SwiftUI

// Article List View
struct ArticleListView: View {

    let articles: [Article]

    var body: some View {
        List(articles) { article in
            ArticleRowView(article: article)
        }
        .listStyle(.plain)
    }
}
