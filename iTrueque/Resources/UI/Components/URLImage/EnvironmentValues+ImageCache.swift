//
//  EnvironmentValues+ImageCache.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 20/10/21.
//

import SwiftUI

/// All this code from: https://github.com/V8tr/AsyncImage with some little changes
struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TemporaryImageCache()
}

// swiftlint:disable implicit_getter
extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
