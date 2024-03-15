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
    static let searchImage: UIImage? = .init(
        systemName: "magnifyingglass"
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
        systemName: "photo"
    )?.withTintColor(
        .secondarySystemBackground,
        renderingMode: .alwaysOriginal
    )
    
    static let photoStackImage: UIImage? = .init(
        systemName: "photo.on.rectangle.angled"
    )?.withTintColor(
        .secondarySystemBackground,
        renderingMode: .alwaysOriginal
    )
}

extension UIImage {
    private enum Constants {
        static let imageSize: CGFloat = 100
    }
}
