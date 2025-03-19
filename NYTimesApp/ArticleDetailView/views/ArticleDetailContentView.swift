//
//  ArticleDetailContentView.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 16/03/2025.

import SwiftUI

struct ArticleDetailContentView: View {

    let article: Article

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ArticleImageView(imageUrl: article.detailViewThumb)
            ArticleTitleView(title: article.title)
            ArticleAbstractView(abstract: article.abstract)
            ArticleMetadataView(author: article.author, publishedDate: article.publishedDate)
            ArticleLinkButton(url: article.url)
            Spacer()
        }
    }
}
