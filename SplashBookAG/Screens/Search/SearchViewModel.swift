//
//  SearchViewModel.swift
//  SplashBookAG
//
//  Created by Alexander on 20.02.2024.
//

import UIKit

final class SearchViewModel {
    private let service: ImageService
    var showLoading: ((Bool) -> Void)?
    
    
    
    // MARK: - Navigation
    
    init(with service: ImageService) {
        self.service = service
    }
    
    func testHandler() {
        self.showLoading?(true)
    }
    
}
