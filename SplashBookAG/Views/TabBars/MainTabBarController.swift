//
//  MainTabBarController.swift
//  SplashBookAG
//
//  Created by Alexander on 31.10.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
    private var initialVCList: [UIViewController]
    
    init(with viewControllers: [UIViewController]) {
        initialVCList = viewControllers
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        var navigationControllers = [UINavigationController]()
        initialVCList.forEach { vc in
            let navController = UINavigationController(rootViewController: vc)
            navigationControllers.append(navController)
        }
        viewControllers = navigationControllers
    }
}
