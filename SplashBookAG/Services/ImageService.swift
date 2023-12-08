//
//  ImageService.swift
//  SplashBookAG
//
//  Created by Alexander on 07.11.2023.
//

import Foundation

protocol ImageService {
    func ыуImages(
        for query: String,
        page: Int,
        pageSize: Int,
        completion: (Result<Photo, Error>) -> Void
    )
}

final class ImageServiceImpl: ImageService {
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func fetchImages(
        for query: String,
        page: Int,
        pageSize: Int,
        completion: (Result<Photo, Error>) -> Void) {
        
    }
    
}

extension ImageServiceImpl {
    private enum Constant {
        static let apiKey = "Some api key"
        static let baseURL = "Some base URL"
    }
}
