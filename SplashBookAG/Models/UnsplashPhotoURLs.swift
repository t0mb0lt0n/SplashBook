//
//  UnsplashPhotoURLs.swift
//  SplashBookAG
//
//  Created by Alexander on 08.12.2023.
//

import Foundation

struct UnsplashPhotoURLs: Decodable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
}
