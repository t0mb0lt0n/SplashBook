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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = MainViewController(viewModel: .init())
        window?.overrideUserInterfaceStyle = .light
        window?.makeKeyAndVisible()
        return true
    }
}

