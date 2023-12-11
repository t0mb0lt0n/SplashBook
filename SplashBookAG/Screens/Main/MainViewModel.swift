//
//  MainViewModel.swift
//  SplashBookAG
//
//  Created by Alexander on 30.10.2023.
//

import Foundation

final class MainViewModel {
    private let service: ImageService
    private(set) var photos: [UnsplashPhoto] = .init()
    
    var numberOfSections: Int {
        1
    }
    
    var numberOfItems: Int {
        photos.count
    }
    
    func findPhotos() {
        service.searchImages(
            for: "New York",
            page: 2,
            pageSize: 2
        ) { result in
            switch result {
            case .success(let photos):
                //print(photos.results)
                print(photos.results.count)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    init(service: ImageService) {
        self.service = service
    }
}
