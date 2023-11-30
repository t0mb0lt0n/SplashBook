//
//  ImageService.swift
//  SplashBookAG
//
//  Created by Alexander on 07.11.2023.
//

import Foundation

protocol ImageService {
   func fetchImages(
    for query: String,
    page: Int,
    pageSize: Int,
    completion: (Result<Photo, Error>) -> Void
   )
}

final class ImageServiceImpl: ImageService {
    func fetchImages(
        for query: String,
        page: Int,
        pageSize: Int,
        completion: (Result<Photo, Error>) -> Void) {
        
    }
    
    
    init() {
        
    }
}
