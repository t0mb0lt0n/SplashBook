//
//  SearchViewController.swift
//  SplashBookAG
//
//  Created by Alexander on 19.02.2024.
//

import UIKit

class SearchViewController: UIViewController {
    private lazy var mainView = view as! SearchView
    private let viewModel: SearchViewModel
    
    init(
        with tabBarItemImage: UIImage?,
        vcTitle: String,
        viewModel: SearchViewModel
    ){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = .searchPhotoTitle
        tabBarItem.image = .searchTabBarItemImage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = SearchView()
        mainView.searchBar.delegate = self
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

extension SearchViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        mainView.searchBar.setShowsCancelButton(true, animated: true)
    }
}
