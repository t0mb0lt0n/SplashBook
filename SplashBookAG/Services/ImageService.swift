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
    completion: (Result<Photo, Error>) -> Void
   )
}

final class ImageService {
    
    init() {
        
    }
}
