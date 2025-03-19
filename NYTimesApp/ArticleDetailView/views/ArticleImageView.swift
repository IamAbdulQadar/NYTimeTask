//
//  ArticleImageView.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 16/03/2025.

import SwiftUI

// Reusable Article Image Component
struct ArticleImageView: View {

    let imageUrl: String?
    private let cardWidth = UIScreen.main.bounds.width - 32
    private let cardHeight: CGFloat = 300

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray.opacity(0.1))
                .frame(width: cardWidth, height: cardHeight)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            CachedImageView(
                url: URL(string: imageUrl ?? ""),
                width: cardWidth,
                height: cardHeight
            )
        }
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 4)
        .padding(.horizontal, 16)
        .padding(.top, 16)
    }
}
