//
//  ImageCache.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 16/03/2025.
//

import UIKit

final class ImageCache {

    /// A concurrent DispatchQueue used for thread-safe operations with the image cache.
    private static let cacheQueue = DispatchQueue(label: "NYTimesApp.ArticleImgCache.queue",
                                                  qos: .userInitiated,
                                                  attributes: .concurrent)

    /// An in-memory cache to store images using NSCache.
    private static let imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.name = "NYTimesApp.ArticleImgCache"  // Name for the cache
        return cache
    }()

    /// Caches an image by associating it with a unique key.
    /// The key is usually a string like the image URL.
    static func cacheImage(_ image: UIImage, forKey key: String) {
        // The `barrier` flag ensures that this operation is exclusive.
        cacheQueue.async(flags: .barrier) {
            imageCache.setObject(image, forKey: key as NSString)
        }
    }

    /// Retrieves a cached image for a given key.
    /// This is a synchronous operation since reading from the cache is thread-safe.
    static func cachedImage(forKey key: String) -> UIImage? {
        return cacheQueue.sync {
            imageCache.object(forKey: key as NSString)
        }
    }

    /// Clears the entire image cache asynchronously.
    /// The `barrier` flag ensures that this operation is exclusive to avoid race conditions.
    static func clearCache() {
        cacheQueue.async(flags: .barrier) {
            imageCache.removeAllObjects()
        }
    }

    /// Loads an image from a given URL.
    /// If the image is already cached, it returns the cached image.
    /// If not, it fetches the image from the network, caches it, and then returns it.
    static func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        // First, check if the image is already cached.
        if let cachedImage = cachedImage(forKey: url.absoluteString) {
            // If the image is cached, immediately return it on the main thread.
            DispatchQueue.main.async {
                completion(cachedImage)
            }
            return
        }

        /// If the image isn't cached, fetch it from the network.
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            // Ensure that the data is valid and convert it into an image.
            guard let data = data, let image = UIImage(data: data) else {
                // If there's an error, return nil.
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }

            /// after downloaded, it should be cache.
            cacheImage(image, forKey: url.absoluteString)

            // Returning downloaded image on the main.
            DispatchQueue.main.async {
                completion(image)
            }
        }

        /// Start the download task.
        dataTask.resume()
    }
}
