//
//  UnsplashPhotoLinks.swift
//  SplashBookAG
//
//  Created by Alexander on 08.12.2023.
//

import Foundation

struct UnsplashPhotoLinks: deco {
    let selfLink: String
    let html: String
    let download: String
    let downloadLocation: String
    
    enum CodingKeys: String, CodingKey {
        case selfLink = "self"
        case html
        case download
        case downloadLocation
    }
}

struct Post: Codable {
    let userId: Int
    let postId: Int
    let title: String
    let body: String
    
    enum CodingKeys: String, CodingKey {
        case userId
        case postId = "id"
        case title
        case body
    }
}
