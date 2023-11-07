//
//  MainViewModel.swift
//  SplashBookAG
//
//  Created by Alexander on 30.10.2023.
//

import Foundation

final class MainViewModel {
    private(set) var source = Source.randomPhotos(with: 11)
    static let a = 1
    
    var numberOfSections: Int {
        //source.count
    }
    
    var numberOfItems: Int {
        source.count
    }
    
    init() {
        
    }
}
