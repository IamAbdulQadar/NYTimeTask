//
//  ErrorView.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 16/03/2025.

import SwiftUI

// Error State View
struct ErrorView: View {

    let errorMessage: String

    var body: some View {
        Text(errorMessage)
            .foregroundColor(.red)
            .multilineTextAlignment(.center)
            .padding()
    }
}
