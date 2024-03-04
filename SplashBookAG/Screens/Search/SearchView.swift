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
        imageView.image = .searchImage
        return imageView
    }()
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .photoImage
        return imageView
    }()
    
    var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "search"
        searchBar.backgroundColor = .green
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
            
            searchImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            searchImageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            searchImageView.widthAnchor.constraint(equalToConstant: Constants.searchImageViewWidth),
            searchImageView.heightAnchor.constraint(equalToConstant: Constants.searchImageViewHeight),
            
            photoImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            photoImageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            photoImageView.widthAnchor.constraint(equalToConstant: Constants.imageViewsWidth),
            photoImageView.heightAnchor.constraint(equalToConstant: Constants.imageViewHeight),
        ])
    }
}

extension SearchView {
    private enum Constants {
        static let searchImageViewWidth: CGFloat = 200
        static let searchImageViewHeight: CGFloat = 200
        static let photoImageViewHeight: CGFloat = 200
        static let photoImageViewWidth: CGFloat = 200
    }
}
