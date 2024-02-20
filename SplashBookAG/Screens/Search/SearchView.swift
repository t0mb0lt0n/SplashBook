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
        return searchBar
    }()
    
    init() {
        super .init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
