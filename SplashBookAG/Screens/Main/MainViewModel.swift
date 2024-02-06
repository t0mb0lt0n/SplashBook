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
    private(set) var stillDownloading = false
    private var currentPage = Constants.startPage
    private var hasMoreContent: Bool {
        photos.count % Constants.pageSize == 0
    }
    var reloadClosure: (() -> Void)?
    var isContentDownloaded: Bool = false {
        didSet {
            isContentDownloaded = false
            reloadClosure?()
            print(self.isContentDownloaded)
        }
    }
    
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
        //guard hasMoreContent else { return }
        service.searchImages(
            for: Constants.request,
            page: currentPage,
            pageSize: Constants.pageSize
        ) { [weak self] result in
            self.continueDownloading(true)
            
            switch result {
            case .success(let photos):
                self.photos = photos.results
                //self.reloadClosure?()
                print("Number of downloaded images = \(self.photos.count)")
                self.currentPage += 1
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func continueDownloading(_ isDownloading: Bool) {
        self.stillDownloading = isDownloading
        self.reloadClosure?()
    }
}

//MARK: - Constants

extension MainViewModel {
    private enum Constants {
        static let request: String = "tupolev"
        static let startPage = 1
        static let pageSize = 16
    }
}
