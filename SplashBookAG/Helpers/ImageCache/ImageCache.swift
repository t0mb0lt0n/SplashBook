//
//  ImageCache.swift
//  SplashBookAG
//
//  Created by Alexander on 20.12.2023.
//

import UIKit

final class ImageCache {
    private let cache = NSCache<NSString, UIImage>()
    
    private init() { }
    
    func image(forKey key: String) -> UIImage? {
        self.cache.object(forKey: key as NSString)
    }
    
    func save(image: UIImage, forKey key: String) {
        self.cache.setObject(image, forKey: key as NSString)
    }
}
