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
        title: String?,
        titleColor: UIColor
    ) {
        self.title = title
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: titleColor
        ]
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: titleColor
        ]
        navigationController?.navigationBar.prefersLargeTitles = isLarge
    }
    
    //init tabbarImage VC
    static let img: UIImage? = UIImage(systemName: "camera.fill")
    
    enum Constantss {
        static let systemColorOrange: UIColor = .systemOrange
        static let systemColorDefaultWhite: UIColor = .white
        static let tabBarItemImage: UIImage? = UIImage(systemName: "camera.fill")
    }
}
