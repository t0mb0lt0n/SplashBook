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
        setupViewModel()
        viewModel.testHandler()
    }
    
    override func loadView() {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBarStyle(
            isLarge: true,
            title: .searchPhotoTitle,
            titleColor: nil
        )
    }
    
    private func setupViewModel() {
        viewModel.showLoading = { [weak self] isLoading in
            guard isLoading else { return }
            self?.mainView.activityIndicator.startAnimating()
        }
    }
}

//MARK: - UISearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        mainView.searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        mainView.searchBar.text?.removeAll()
        mainView.searchBar.setShowsCancelButton(false, animated: true)
        mainView.searchBar.resignFirstResponder()
        mainView.activityIndicator.stopAnimating()
        mainView.photoImageView.isHidden = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        mainView.searchBar.text?.removeAll()
        mainView.searchBar.endEditing(true)
        mainView.searchBar.setShowsCancelButton(false, animated: true)
        mainView.activityIndicator.startAnimating()
        mainView.photoImageView.isHidden = true
    }
}
