//
//  SearchViewController.swift
//  SplashBookAG
//
//  Created by Alexander on 19.02.2024.
//

import UIKit

class SearchViewController: UIViewController {
    private lazy var mainView = view as! SearchView
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = .searchPhotoTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view = SearchView()
        //title = "vc1"
        //tabBarItem.image = UIImage(systemName: "camera.fill")
       
    }
    
    override func loadView() {
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        setupNavigationBarStyle(
//            isLarge: true,
//            title: .searchPhotoTitle,
//            titleColor: .systemOrange
//        )
//        setupTabBarStyle(
//            backgroundColor: .systemBackground,
//            normalItemColor: .red,
//            selectedItemColor: .red
//        )
    }
    
    // MARK: - Navigation
}
