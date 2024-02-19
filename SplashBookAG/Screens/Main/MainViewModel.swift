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
    private(set) var isContentDownloading = false
    private var currentPage = Constants.startPage
    private var hasMoreContent: Bool {
        photos.count % Constants.pageSize == 0
    }
    var reloadClosure: (() -> Void)?
    var isContentDownloaded: Bool = false {

    
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
        handleLoadingEvent(true)
        service.searchImages(
            for: Constants.request,
            page: currentPage,
            pageSize: Constants.pageSize
        ) { [weak self] result in
            self?.reloadClosure?()
            self?.handleLoadingEvent(false)
            print("Current page is \(String(describing: self?.currentPage))")
            switch result {
            case .success(let downloadedPhotos):
                self?.photos.append(contentsOf: downloadedPhotos.results)
                self?.reloadClosure?()
                print("Number of downloaded images = \(String(describing: self?.photos.count))")
                self?.currentPage += 1
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
         reloadClosure?()
    }
    
    func handleLoadingEvent(_ isDownloading: Bool) {
        self.isContentDownloading = isDownloading
    }
}

//MARK: - Constants

extension MainViewModel {
    private enum Constants {
        static let request: String = "city"
        static let startPage = 1
        static let pageSize = 5
    }
}
