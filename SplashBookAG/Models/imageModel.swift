//
//  imageModel.swift
//  SplashBookAG
//
//  Created by Alexander on 06.10.2023.
//

import Foundation

struct Source {
    static func getAllPhotos() -> [Photo] {
        [
            .init(id: 1, imageName: "person.crop.circle.badge.moon.fill"),
            .init(id: 2, imageName: "person.crop.circle.badge.moon.fill"),
            .init(id: 3, imageName: "person.crop.circle.badge.moon.fill"),
            .init(id: 4, imageName: "person.crop.circle.badge.moon.fill"),
            .init(id: 5, imageName: "person.crop.circle.badge.moon.fill"),
            .init(id: 6, imageName: "person.crop.circle.badge.moon.fill"),
            .init(id: 7, imageName: "person.crop.circle.badge.moon.fill"),
            .init(id: 8, imageName: "person.crop.circle.badge.moon.fill"),
            .init(id: 9, imageName: "person.crop.circle.badge.moon.fill"),
            .init(id: 10, imageName: "person.crop.circle.badge.moon.fill"),
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
