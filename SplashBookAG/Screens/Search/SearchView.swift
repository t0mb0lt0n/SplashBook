//
//  SearchView.swift
//  SplashBookAG
//
//  Created by Alexander on 19.02.2024.
//

import UIKit

final class SearchView: UIView {
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .searchBackgroundImage
        return imageView
    }()
    
    var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = .searchBarPlaceholder
        searchBar.searchBarStyle = .minimal
        //searchBar.showsCancelButton = true
        //searchBar.tintColor = .systemOrange
        //searchBar.setShowsCancelButton(true, animated: true)
//        UIBarButtonItem.appearance(whenContainedInInstancesOf: []).setTitleTextAttributes([.foregroundColor : UIColor.systemOrange], for: .normal)
        return searchBar
    }()
    
    init() {
        super .init(frame: .zero)
        backgroundColor = .systemBackground
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        [searchBar,
         photoImageView,
        ].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(subView)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            photoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            photoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}

extension SearchView {
}
