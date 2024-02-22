//
//  SearchViewController.swift
//  SplashBookAG
//
//  Created by Alexander on 19.02.2024.
//

import UIKit

class SearchViewController: UIViewController {
    private lazy var mainView = view as! SearchView

    override func viewDidLoad() {
        super.viewDidLoad()
        view = SearchView()
        title = "Search photo"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBarStyle(
            isLarge: true,
            title: .searchPhotoTitle,
            titleColor: .systemOrange
        )
    }
    
    // MARK: - Navigation
}
