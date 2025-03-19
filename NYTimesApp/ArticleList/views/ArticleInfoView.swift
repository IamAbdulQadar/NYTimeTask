//
//  ArticleInfoView.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 16/03/2025.

import SwiftUI

// Article Information
struct ArticleInfoView: View {

    let article: Article

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(article.title ?? "Untitled")
                .font(.headline)
                .lineLimit(2)
            Text(article.author ?? "Unknown Author")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text(article.publishedDate ?? "No Date")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}
