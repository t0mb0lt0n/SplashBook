//
//  MainTabBarController.swift
//  SplashBookAG
//
//  Created by Alexander on 31.10.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
    private var vcList: [UIViewController]
    
    init(with vcList: [UIViewController]) {
        self.vcList = vcList
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarStyle(
            backgroundColor: .systemBackground,
            normalItemColor: .systemGray,
            selectedItemColor: .systemOrange
        )
        setupTabBar(with: vcList)
    }
    
    private func setupTabBar(with viewControllers: [UIViewController]) {
        var navigationControllers = [UINavigationController]()
        viewControllers.forEach { vc in
            let navController = UINavigationController(rootViewController: vc)
            navigationControllers.append(navController)
        }
        self.viewControllers = navigationControllers
    }
}
