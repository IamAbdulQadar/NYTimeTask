//
//  ArticleLinkButton.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 16/03/2025.

import SwiftUI

struct ArticleLinkButton: View {

    let url: String?

    var body: some View {
        Button(action: {
            guard let urlString = url, let url = URL(string: urlString) else { return }
            UIApplication.shared.open(url)
        }) {
            Text("Read Full Article")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding()
                .background(NYTimesColor.buttonBackgroundColor.color)
                .foregroundColor(NYTimesColor.buttonTitleColor.color)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 3)
        }
        .padding(.horizontal)
    }
}
