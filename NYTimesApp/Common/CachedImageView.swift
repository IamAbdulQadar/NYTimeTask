//
//  CachedImageView.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 16/03/2025.
//

import SwiftUI

struct CachedImageView: View {

    let url: URL?
    let width: CGFloat
    let height: CGFloat
    @State private var image: UIImage?

    var body: some View {
        Group {
            if let image = image { /// Check if image is already available
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill() /// Ensures image covers the frame
                    .frame(width: width, height: height)
                    .clipShape(RoundedRectangle(cornerRadius: 12)) /// Rounded corners
                    .clipped() /// Ensures no overflow beyond the frame
            } else if url != nil { /// Check if URL is available and image is not already loaded/
                ProgressView() /// Show loading indicator while image is fetched
                    .frame(width: width, height: height)
            } else { /// Handle the case where no image and no URL are available
                Color.gray
                    .frame(width: width, height: height)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(Text("No Image")
                        .font(.caption)
                        .foregroundColor(.white)) // Placeholder text
            }
        }
        .onAppear {
            loadImage() // Load image when view appears
        }
    }

    private func loadImage() {
        /// Only load the image if the URL is valid and no image has been loaded yet
        guard let url = url, image == nil else { return }
        /// Fetch image from the cache or download if not cached
        ImageCache.loadImage(from: url) { loadedImage in
            self.image = loadedImage
        }
    }
}
