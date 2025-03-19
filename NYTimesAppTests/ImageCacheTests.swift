//
//  ImageCacheTests.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 19/03/2025.
//

import XCTest
@testable import NYTimesApp

class ImageCacheTests: XCTestCase {

    func testImageCache() {
        // Setup
        let url = URL(string: "https://example.com/image.png")!
        let image = UIImage() // A mock image for testing

        // Cache image
        ImageCache.cacheImage(image, forKey: url.absoluteString)

        // Test if the image is cached
        let cachedImage = ImageCache.cachedImage(forKey: url.absoluteString)
        XCTAssertNotNil(cachedImage)
    }
}
