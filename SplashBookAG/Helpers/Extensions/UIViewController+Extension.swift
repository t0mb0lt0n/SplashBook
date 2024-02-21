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
}
