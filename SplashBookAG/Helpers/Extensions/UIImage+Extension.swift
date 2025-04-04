//
//  UIImage+Extension.swift
//  SplashBookAG
//
//  Created by Alexander on 04.03.2024.
//

import UIKit

extension UIImage {
    private enum Constants {
        static let imageSize: CGFloat = 100.0
    }
    static let editoralTabBarItemImage: UIImage? = .init(systemName: .editoralTabBarItemIcon)
    static let searchTabBarItemImage: UIImage? = .init(systemName: .searchIcon)
    static let searchImage: UIImage? = .init(
        systemName: .searchBackgroundImage
    )?.withTintColor(
        .secondarySystemBackground,
        renderingMode: .alwaysOriginal
    )
    
    static let searchBackgroundImage: UIImage? = {
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: Constants.imageSize)
        let image = UIImage(
            systemName: .searchBackgroundImage,
            withConfiguration: imageConfiguration
        )?.withTintColor(
            .secondarySystemBackground,
            renderingMode: .alwaysOriginal
        )
        return image
    }()
    
    static let photoImage: UIImage? = .init(
        systemName: .photoStackIcon
    )?.withTintColor(
        .secondarySystemBackground,
        renderingMode: .alwaysOriginal
    )
    
    static let photoStackImage: UIImage? = .init(
        systemName: .photoStackIcon
    )?.withTintColor(
        .secondarySystemBackground,
        renderingMode: .alwaysOriginal
    )
}
