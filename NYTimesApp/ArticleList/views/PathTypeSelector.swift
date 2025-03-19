//
//  PathTypeSelector.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 16/03/2025.

import SwiftUI

struct PathTypeSelector: ToolbarContent {

    @Binding var pathType: PathType

    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) { // This places it on the left
            Menu {
                ForEach(PathType.allCases) { pathOption in
                    Button {
                        pathType = pathOption
                    } label: {
                        Label(
                            pathOption.title(),
                            systemImage: pathType == pathOption ? "checkmark" : "shared.with.you"
                        )
                    }
                }
            } label: {
                Image(systemName: "shared.with.you")
            }
        }
    }
}
