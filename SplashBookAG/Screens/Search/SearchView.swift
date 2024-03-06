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
        let image: UIImage? = .photoStackImage
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 300)
        imageView.image = UIImage(systemName: .searchBackgroundImage, withConfiguration: imageConfiguration)?.withTintColor(
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
            
            searchImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            searchImageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            //searchImageView.widthAnchor.constraint(equalToConstant: Constants.searchImageViewWidth),
            //searchImageView.heightAnchor.constraint(equalToConstant: Constants.searchImageViewHeight),
            
            photoImageView.centerXAnchor.constraint(equalTo: searchImageView.centerXAnchor),
            photoImageView.centerYAnchor.constraint(equalTo: searchImageView.centerYAnchor),
            //photoImageView.widthAnchor.constraint(equalToConstant: Constants.photoImageViewWidth),
            //photoImageView.heightAnchor.constraint(equalToConstant: Constants.photoImageViewHeight),
        ])
    }
}

extension SearchView {
    private enum Constants {
        static let imageSize: CGFloat = 
        //static let searchImageViewWidth: CGFloat = 110
        //static let searchImageViewHeight: CGFloat = 100
        //static let photoImageViewHeight: CGFloat = 100//35
        //static let photoImageViewWidth: CGFloat = 130//45
        
    }
}
