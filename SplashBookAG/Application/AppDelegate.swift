//
//  AppDelegate.swift
//  SplashBookAG
//
//  Created by Alexander on 05.10.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
    _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow()
        window?.rootViewController = MainTabBarController(
            with: [
                MainViewController(
                    with: .editoralTabBarItemImage,
                    vcTitle: .editoralTitle,
                    viewModel: .init(
                        service: ImageServiceImpl(
                            networkClient: NetworkClient(
                                session: .init(configuration: .default)
                            )
                        )
                    )
                ),
                SearchViewController(
                    with: .searchTabBarItemImage,
                    vcTitle: .searchPhotoTitle,
                    viewModel: .init()
                )
            ]
        )
        window?.overrideUserInterfaceStyle = .dark
        window?.makeKeyAndVisible()
        return true
    }
}

