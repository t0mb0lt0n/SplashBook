//
//  SearchView.swift
//  SplashBookAG
//
//  Created by Alexander on 19.02.2024.
//

import UIKit

final class SearchView: UIView {
    lazy var searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = nil
        return imageView
    }()
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: Constants.imageSize)
        
        imageView.image = UIImage(
            systemName: .searchBackgroundImage,
            withConfiguration: imageConfiguration
        )?.withTintColor(
            .secondarySystemBackground,
            renderingMode: .alwaysOriginal
        )
        return imageView
    }()
    
    var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = .searchBarPlaceholder
        searchBar.searchBarStyle = .minimal
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
         searchImageView,
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
    private enum Constants {
        static let imageSize: CGFloat = 100
    }
}
