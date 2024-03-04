//
//  SearchView.swift
//  SplashBookAG
//
//  Created by Alexander on 19.02.2024.
//

import UIKit

final class SearchView: UIView {
    lazy var searchBar: UISearchBar = {
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
        [searchBar].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(subView)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
//            searchBar.widthAnchor.constraint(equalToConstant: safeAreaLayoutGuide.leadingAnchor),
            //searchBar.heightAnchor.constraint(equalToConstant: Constants.searchBarHeight),
        ])
    }
}

extension SearchView {
    private enum Constants {
        static let searchBarWidth: CGFloat = 0.0
        static let searchBarHeight: CGFloat = 500.0
    }
}
