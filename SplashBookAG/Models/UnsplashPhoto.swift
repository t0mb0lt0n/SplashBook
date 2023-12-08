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
    let urls: UnsplashPhotoURLs
    let unsplashPhotoLinks: UnsplashPhotoLinks
    let likes: Int
    let likedByUser: String
    let unsplashUser: UnsplashUser
    
    enum CodingKeys: String, CodingKey {
        case width
        case height
        case description
        case altDescription
        case urls
        case likes
        case likedByUser
        case unsplashPhotoLinks = "links"
        case unsplashUser = "user"
    }
}
