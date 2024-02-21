//
//  UIViewController+Extension.swift
//  SplashBookAG
//
//  Created by Alexander on 21.02.2024.
//

import UIKit

extension UIViewController {
    final func setupNavigationBarStyle(
        isLarge: Bool,
        titleColor: UIColor
    ) {
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: titleColor
        ]
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: titleColor
        ]
        navigationController?.navigationBar.prefersLargeTitles = isLarge
    }
    
//    final func setupTabBarStyle(
//        backgroundColor: UIColor,
//        normalItemColor: UIColor,
//        selectedItemColor: UIColor
//    ) {
//        let tabBarApperance = UITabBarAppearance()
//        tabBarApperance.backgroundColor = backgroundColor.withAlphaComponent(0.1)
//        let tabBarItemApperance = UITabBarItemAppearance()
//        tabBarItemApperance.normal.iconColor = normalItemColor
//        tabBarItemApperance.selected.iconColor = selectedItemColor
//        tabBarItemApperance.normal.titleTextAttributes = [
//            NSAttributedString.Key.foregroundColor: normalItemColor
//        ]
//        tabBarItemApperance.selected.titleTextAttributes = [
//            NSAttributedString.Key.foregroundColor: selectedItemColor
//        ]
//        tabBarController?.tabBar.scrollEdgeAppearance = tabBarApperance
//        tabBarController?.tabBar.scrollEdgeAppearance?.stackedLayoutAppearance = tabBarItemApperance
//    }
    
        final func setupTabBarStyle(
            backgroundColor: UIColor,
            normalItemColor: UIColor,
            selectedItemColor: UIColor
        ) {
            let tabBarApperance = UITabBarAppearance()
            tabBarApperance.backgroundColor = backgroundColor.withAlphaComponent(0.1)
            let tabBarItemApperance = UITabBarItemAppearance()
            tabBarItemApperance.normal.iconColor = normalItemColor
            tabBarItemApperance.selected.iconColor = selectedItemColor
            tabBarItemApperance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: normalItemColor]
            tabBarItemApperance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: selectedItemColor]
            tabBarController?.tabBar.scrollEdgeAppearance = tabBarApperance
            tabBarController?.tabBar.scrollEdgeAppearance?.stackedLayoutAppearance = tabBarItemApperance
        }

}
