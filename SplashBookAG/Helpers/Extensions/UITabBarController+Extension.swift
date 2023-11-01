//
//  UITabBarController+Extension.swift
//  SplashBookAG
//
//  Created by Alexander on 31.10.2023.
//

import Foundation
import UIKit

extension UITabBarController {
    func createNavigationControler(vc: UIViewController,
                                   itemTitle: String,
                                   itemImageName: String) -> UINavigationController {
        vc.title = itemTitle
        let tabBarItem = UITabBarItem(title: itemTitle,
                                      image: UIImage(systemName: itemImageName),
                                      tag: 0)
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = tabBarItem
        return navController
    }
    
    func setupTabBarStyle() {
        let tabBarApperance = UITabBarAppearance()
        tabBarApperance.backgroundColor = .black
        let tabBarItemApperance = UITabBarItemAppearance()
        tabBarItemApperance.normal.iconColor = .systemGray
        tabBarItemApperance.selected.iconColor = .systemOrange
        tabBarItemApperance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemOrange]
        tabBar.scrollEdgeAppearance = tabBarApperance
        tabBar.scrollEdgeAppearance?.stackedLayoutAppearance = tabBarItemApperance
    }
}
