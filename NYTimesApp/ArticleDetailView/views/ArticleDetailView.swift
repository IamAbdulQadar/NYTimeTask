//
//  ArticleDetailView.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 16/03/2025.

import SwiftUI

struct ArticleDetailView: View {

    let article: Article

    var body: some View {
        ScrollView {
            ArticleDetailContentView(article: article)
        }
        .navigationTitle("Article Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
