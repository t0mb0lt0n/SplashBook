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
    var reloadClosure: (() -> Void)?
    
    var numberOfSections: Int {
        1
    }
    
    var numberOfItems: Int {
        photos.count
    }
    
    init(service: ImageService) {
        self.service = service
    }
    
    func findPhotos() {
        service.searchImages(
            for: Constants.request,
            page: 1,
            pageSize: 30
        ) { result in
            switch result {
            case .success(let photos):
                self.photos = photos.results
                self.reloadClosure?()
                print(self.photos.count)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

//MARK: Constants

extension MainViewModel {
    private enum Constants {
        static let request: String = "New York"
    }
}
