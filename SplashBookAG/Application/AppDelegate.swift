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
    //private let service = ImageServiceImpl(networkClient: .init(session: .))
    
    func application(
    _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow()
        window?.rootViewController = MainTabBarController(
            with: [MainViewController(
                viewModel: .init(
                    service: ImageServiceImpl(
                        networkClient: NetworkClient(
                            session: .init(configuration: .default)
                        )
                    )
                )
            )]
        )
        window?.overrideUserInterfaceStyle = .dark
        window?.makeKeyAndVisible()
        return true
    }
}

