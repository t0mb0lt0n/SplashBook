//
//  ImageService.swift
//  SplashBookAG
//
//  Created by Alexander on 07.11.2023.
//

import Foundation

protocol ImageService {
    func searchImages(
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
    
    func searchImages(
        for query: String,
        page: Int,
        pageSize: Int,
        completion: (Result<Photo, Error>) -> Void
    ) {
        let parameters = [
            "client_id": Constants.clientID,
            "query": query,
            "page": page,
            "per_page": pageSize
        ] as [String: Any]
        
    }
    
}

extension ImageServiceImpl {
    private enum Constants {
        static let apiKey = "Some api key"
        static let baseURL = "https://api.unsplash.com"
        static let clientID = "T8KSuS49xCEo9qYDLmYLohNwB95ePuJvqMIUrH5aQKg"
    }
}
