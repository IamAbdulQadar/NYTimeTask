//
//  ArticleTitleView.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 16/03/2025.

import SwiftUI

// Reusable Title Component
struct ArticleTitleView: View {

    let title: String?

    var body: some View {
        Text(title ?? "Untitled")
            .font(.title)
            .padding(.horizontal)
    }
}
