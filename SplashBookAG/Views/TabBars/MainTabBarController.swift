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
//        setupNavigationBarStyle(
//            isLarge: true,
//            title: .searchPhotoTitle,
//            titleColor: .systemOrange
//        )
    }
    
//    final func setupTabBarStyle(
//        backgroundColor: UIColor,
//        normalItemColor: UIColor,
//        selectedItemColor: UIColor
//    ) {
//        let navController1 = setupVCForTabBar(initialVCList[0], tabBarItemName: "camera.fill", tabBarImage: "camera.fill")
//        let navController2 = setupVCForTabBar(initialVCList[1], tabBarItemName: "camera.fill", tabBarImage: "camera.fill")
//        let tabBarApperance = UITabBarAppearance()
//        tabBarApperance.backgroundColor = .systemBackground
//        let tabBarItemApperance = UITabBarItemAppearance()
//        tabBarItemApperance.normal.iconColor = normalItemColor
//        tabBarItemApperance.selected.iconColor = selectedItemColor
//        tabBarApperance.configureWithTransparentBackground()
//        tabBarItemApperance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: normalItemColor]
//        tabBarItemApperance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: selectedItemColor]
//        tabBar.scrollEdgeAppearance = tabBarApperance
//        tabBar.scrollEdgeAppearance?.stackedLayoutAppearance = tabBarItemApperance
//        viewControllers = [navController1, navController2]
//    }
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

    
    private func setupVCForTabBar(
        _ vc: UIViewController,
        tabBarItemName: String?,
        tabBarImage: String
    ) -> UINavigationController {
        vc.title = tabBarItemName
        //vc.
        let item = UITabBarItem(
            title: tabBarItemName,
            image: UIImage(systemName: "camera.fill"),
            tag: 0
        )
        setupNavigationBarStyle(
            isLarge: true,
            title: .searchPhotoTitle,
            titleColor: .systemOrange
        )
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        return navController
    }
    
    private func setupTabBar() {
        var navigationControllers = [UINavigationController]()
        initialVCList.forEach { vc in
            let navController = setupVCForTabBar(vc, tabBarItemName: vc.title, tabBarImage: "camera.fill")
            //let navController = UINavigationController(rootViewController: vc)
            let item = UITabBarItem(title: vc.navigationItem.title, image: UIImage(systemName: "camera.fill"), tag: 0)
            //let navController = UINavigationController(rootViewController: vc)
            navController.tabBarItem = item
            navigationControllers.append(navController)
            
        }

//        let navController1 = setupVCForTabBar(initialVCList[0], tabBarItemName: "camera.fill", tabBarImage: "camera.fill")
//        let navController2 = setupVCForTabBar(initialVCList[1], tabBarItemName: "camera.fill", tabBarImage: "camera.fill")

        //viewControllers = [navController1, navController2]
        viewControllers = navigationControllers
    }
}
