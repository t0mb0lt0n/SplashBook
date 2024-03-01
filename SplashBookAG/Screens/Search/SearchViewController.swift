//
//  SearchViewController.swift
//  SplashBookAG
//
//  Created by Alexander on 19.02.2024.
//

import UIKit

class SearchViewController: UIViewController {
    private lazy var mainView = view as! SearchView

    override func viewDidLoad() {
        super.viewDidLoad()
        view = SearchView()
        title = "Search photo"
        //tabBarItem.image = UIImage(systemName: "camera.fill")
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBarStyle(
            isLarge: true,
            title: .searchPhotoTitle,
            titleColor: .systemOrange
        )
//        setupTabBarStyle(
//            backgroundColor: .systemBackground,
//            normalItemColor: .red,
//            selectedItemColor: .red
//        )
    }
    
    // MARK: - Navigation
}
