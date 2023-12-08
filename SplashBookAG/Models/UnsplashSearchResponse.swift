//
//  UnsplashSearchResponse.swift
//  SplashBookAG
//
//  Created by Alexander on 07.12.2023.
//

import Foundation

struct UnsplashSearchResponse: Decodable {
    let total: Int
    let totalPages: Int
    let results: [UnsplashPhoto]
}
