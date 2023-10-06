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
            .init(id: 1, imageName: "Some_Name_1"),
            .init(id: 2, imageName: "Some_Name_2"),
            .init(id: 3, imageName: "Some_Name_3"),
            .init(id: 4, imageName: "Some_Name_4"),
            .init(id: 5, imageName: "Some_Name_5"),
            .init(id: 6, imageName: "Some_Name_6"),
            .init(id: 7, imageName: "Some_Name_7"),
            .init(id: 8, imageName: "Some_Name_8"),
            .init(id: 9, imageName: "Some_Name_9"),
            .init(id: 10, imageName: "Some_Name_10"),
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
