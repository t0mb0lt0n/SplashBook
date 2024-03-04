//
//  UIImage+Extension.swift
//  SplashBookAG
//
//  Created by Alexander on 04.03.2024.
//

import UIKit

extension UIImage {
    static let editoralTabBarItemImage: UIImage? = .init(systemName: "camera.fill")
    static let searchTabBarItemImage: UIImage? = .init(systemName: "magnifyingglass")
    static let searchImage: UIImage? = .init(systemName: "magnifyingglass")?.withTintColor(
        .systemOrange,
        renderingMode: .alwaysOriginal
    )
    static let photoImage: UIImage? = .init(systemName: "photo")?.withTintColor(
        .systemOrange,
        renderingMode: .alwaysOriginal
    )
}
