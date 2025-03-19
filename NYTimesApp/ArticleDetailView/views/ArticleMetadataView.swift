//
//  ArticleMetadataView.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 16/03/2025.

import SwiftUI

// Reusable Metadata Component
struct ArticleMetadataView: View {

    let author: String?
    let publishedDate: String?
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("By \(author ?? "Unknown Author")")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("Published: \(publishedDate ?? "No Date")")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
    }
}
