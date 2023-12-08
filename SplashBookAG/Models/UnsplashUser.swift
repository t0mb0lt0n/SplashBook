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
    let portfolioURL: String
    
}
