//
//  imageModel.swift
//  SplashBookAG
//
//  Created by Alexander on 06.10.2023.
//

import Foundation

struct Source {
    static func getAllPhotos() -> [Photo] {
        [.init(id: 0, imageName: "TestImage0"),
         .init(id: 1, imageName: "TestImage1"),
         .init(id: 2, imageName: "TestImage2"),
         .init(id: 3, imageName: "TestImage3"),
         .init(id: 4, imageName: "TestImage4"),
         .init(id: 5, imageName: "TestImage5"),
         .init(id: 6, imageName: "TestImage6"),
         .init(id: 7, imageName: "TestImage7"),
         .init(id: 8, imageName: "TestImage8"),
         .init(id: 0, imageName: "TestImage0"),
         .init(id: 1, imageName: "TestImage1"),
         .init(id: 2, imageName: "TestImage2"),
         .init(id: 3, imageName: "TestImage3"),
         .init(id: 4, imageName: "TestImage4"),
         .init(id: 5, imageName: "TestImage5"),
         .init(id: 6, imageName: "TestImage6"),
         .init(id: 3, imageName: "TestImage7"),
         .init(id: 8, imageName: "TestImage8"),
        ]
    }
    
    static func randomPhotos(with count: Int) -> [Photo] {
        (0..<count).map {_ in getAllPhotos().randomElement()! }
    }
}

struct Photo {
    let id: Int
    let imageName: String
}

