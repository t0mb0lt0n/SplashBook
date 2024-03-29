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
        setupTabBarStyle(
            backgroundColor: .black,
            normalItemColor: .systemGray,
            selectedItemColor: .systemOrange
        )
    }
    
    final func setupTabBarStyle(
        backgroundColor: UIColor,
        normalItemColor: UIColor,
        selectedItemColor: UIColor
    ) {
        let tabBarApperance = UITabBarAppearance()
        tabBarApperance.backgroundColor = .systemBackground
        let tabBarItemApperance = UITabBarItemAppearance()
        tabBarItemApperance.normal.iconColor = normalItemColor
        tabBarItemApperance.selected.iconColor = selectedItemColor
        tabBarApperance.configureWithTransparentBackground()
        tabBarItemApperance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: normalItemColor]
        tabBarItemApperance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: selectedItemColor]
        tabBar.scrollEdgeAppearance = tabBarApperance
        tabBar.scrollEdgeAppearance?.stackedLayoutAppearance = tabBarItemApperance
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
