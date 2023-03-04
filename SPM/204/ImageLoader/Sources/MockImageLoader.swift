//
// MockImageLoader.swift
//
// Created by Teacher on 04.03.2023.
//

import UIKit

public class MockImageLoader: ImageLoader {
    public init() {}

    public func loadImage(_ url: URL) async throws -> UIImage {
        UIImage()
    }

    public func loadImage(_ string: String) async throws -> UIImage {
        if let url = URL(string: string) {
            return try await loadImage(url)
        } else {
            throw ImageLoaderError.unknownURL
        }
    }
}
