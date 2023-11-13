//
//  MainViewModel.swift
//  SplashBookAG
//
//  Created by Alexander on 30.10.2023.
//

import Foundation

final class MainViewModel {
    private(set) var source = Source.randomPhotos(with: 11)
    private let service: ImageService
    
    var numberOfSections: Int {
        1
    }
    
    var numberOfItems: Int {
        source.count
    }
    
    init(service: ImageService) {
        self.service = service
    }
}
