//
// URLImageLoader.swift
//
// Created by Teacher on 04.03.2023.
//

import UIKit

public class URLImageLoader: ImageLoader {
    public init() {}

    public func loadImage(_ url: URL) async throws -> UIImage {
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let image = UIImage(data: data) else {
            throw ImageLoaderError.brokenImage
        }
        return image
    }

    public func loadImage(_ string: String) async throws -> UIImage {
        if let url = URL(string: string) {
            return try await loadImage(url)
        } else {
            throw ImageLoaderError.unknownURL
        }
    }
}
