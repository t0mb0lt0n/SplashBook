//
//  SearchView.swift
//  SplashBookAG
//
//  Created by Alexander on 19.02.2024.
//

import UIKit

final class SearchView: UIView {
    let collectionView = UnsplashCollectionView()
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .searchBackgroundImage
        return imageView
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        let transform = CGAffineTransform.init(
            scaleX: Constants.activityIndicatorScale,
            y: Constants.activityIndicatorScale
        )
        activityIndicator.transform = transform
        return activityIndicator
    }()

    var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = .searchBarPlaceholder
        searchBar.searchBarStyle = .minimal
        searchBar.accessibilityNavigationStyle = .combined
        searchBar.searchTextField.clearButtonMode = .whileEditing
        searchBar.keyboardAppearance = .dark
        searchBar.returnKeyType = .search
        UIBarButtonItem.appearance(
            whenContainedInInstancesOf: [UISearchBar.self]
        ).setTitleTextAttributes(
                [.foregroundColor : UIColor.systemOrange],
                for: .normal
        )
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
         activityIndicator,
         collectionView
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
            
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: Constants.borderSpacing
            ),
            collectionView.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: Constants.borderSpacing
            ),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

        ])
    }
}

// MARK: - Constants

extension SearchView {
    private enum Constants {
        static let activityIndicatorScale: CGFloat = 2
        static let borderSpacing: CGFloat = 1
    }
}
