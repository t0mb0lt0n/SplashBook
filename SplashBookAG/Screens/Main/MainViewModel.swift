//
//  MainViewModel.swift
//  SplashBookAG
//
//  Created by Alexander on 30.10.2023.
//

import Foundation

final class MainViewModel {
    private(set) var source = Source.randomPhotos(with: 30)
    private let service: ImageService
    
    var numberOfSections: Int {
        1
    }
    
    var numberOfItems: Int {
        source.count
    }
    
    func findPhotos() {
        service.searchImages(
            for: "New York",
            page: 30,
            pageSize: 30
        ) { result in
            switch result {
            case .success(let photos):
                print(photos.results)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    init(service: ImageService) {
        self.service = service
    }
}
