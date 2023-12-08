//
//  UnsplashUser.swift
//  SplashBookAG
//
//  Created by Alexander on 08.12.2023.
//

import Foundation

struct UnsplashUser: Decodable {
    let id: String
    let username: String
    let name: String
    let firstName: String
    let lastName: String
    let twitterUsername: String
    let portfolioUrl: String
    let bio: String
    let location: String
    let profileImage: UnsplashUserProfileImage
    let instagramUsername: String
    let totalLikes: Int
    let totalPhotos: Int
}
