//
//  ArticleRowView.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 16/03/2025.

import SwiftUI

// Individual Article Row
struct ArticleRowView: View {

    let article: Article

    var body: some View {
        NavigationLink(destination: ArticleDetailView(article: article)) {
            HStack(alignment: .center, spacing: 15) {
                CachedImageView(
                    url: URL(string: article.articlImageUrl ?? ""),
                    width: 80,
                    height: 80
                )
                ArticleInfoView(article: article)
            }
            .padding(.vertical, 5)
        }
    }
}
