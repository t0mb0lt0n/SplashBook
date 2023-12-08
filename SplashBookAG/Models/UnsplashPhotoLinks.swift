//
//  UnsplashPhotoLinks.swift
//  SplashBookAG
//
//  Created by Alexander on 08.12.2023.
//

import Foundation

struct UnsplashPhotoLinks: Decodable {
    let selfLink: String
    let html: String
    let download: String
    let downloadLocation: String
}
