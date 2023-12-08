//
//  UnsplashPhoto.swift
//  SplashBookAG
//
//  Created by Alexander on 07.12.2023.
//

import Foundation

struct UnsplashPhoto: Decodable {
    let width: Int
    let height: Int
    let description: String
    let altDescription: String
    let likes: Int
    let likedByUser: Bool
    let unsplashPhotoLinks: UnsplashPhotoLinks
    let urls: UnsplashPhotoURLs
    let unsplashUser: UnsplashUser
}
