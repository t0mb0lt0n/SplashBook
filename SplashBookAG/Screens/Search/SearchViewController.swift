//
//  SearchViewController.swift
//  SplashBookAG
//
//  Created by Alexander on 19.02.2024.
//

import UIKit

class SearchViewController: UIViewController {
    private lazy var mainView = view as! SearchView
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = .searchPhotoTitle
        tabBarItem.image = Constants.tabBarItemImage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view = SearchView()
    }
    
    override func loadView() {
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

extension SearchViewController {
    private enum Constants {
        static let tabBarItemImage: UIImage? = UIImage(systemName: "square")
    }
}
