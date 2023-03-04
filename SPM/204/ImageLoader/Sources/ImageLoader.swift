//
// ImageLoader.swift
//
// Created by Teacher on 04.03.2023.
//

import UIKit

public enum ImageLoaderError: Error {
    case unknownURL
    case brokenImage
}

public protocol ImageLoader {
    func loadImage(_ url: URL) async throws -> UIImage
    func loadImage(_ string: String) async throws -> UIImage
}
