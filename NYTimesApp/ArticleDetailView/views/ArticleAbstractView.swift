//
//  ArticleAbstractView.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 16/03/2025.

import SwiftUI
// Reusable Abstract Component
struct ArticleAbstractView: View {

    let abstract: String?

    var body: some View {
        Text(abstract ?? "No abstract available")
            .font(.body)
            .foregroundColor(.secondary)
            .padding(.horizontal)
    }
}
