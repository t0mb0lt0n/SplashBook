//
//  imageModel.swift
//  SplashBookAG
//
//  Created by Alexander on 06.10.2023.
//

import Foundation

struct Source {
    static func getAllPhotos() -> [Photo] {
        [.init(id: 1, imageName: "TestImage"),
         .init(id: 2, imageName: "TestImage"),
         .init(id: 3, imageName: "TestImage"),
         .init(id: 4, imageName: "TestImage"),
         .init(id: 5, imageName: "TestImage"),
         .init(id: 6, imageName: "TestImage"),
         .init(id: 7, imageName: "TestImage"),
         .init(id: 8, imageName: "TestImage"),
         .init(id: 9, imageName: "TestImage"),
         .init(id: 10, imageName: "TestImage"),
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

struct SectionPhoto {
    let sectionName: String
    var photos: [Photo]
}
