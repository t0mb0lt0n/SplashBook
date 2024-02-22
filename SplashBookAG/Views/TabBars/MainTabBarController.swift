//
//  MainTabBarController.swift
//  SplashBookAG
//
//  Created by Alexander on 31.10.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
    private var initialVCList: [UIViewController]
    
    init(with vcList: [UIViewController]) {
        self.vcList = vcList
        super.init(nibName: nil, bundle: nil)
        viewControllers = vcList
        print(viewControllers)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
//        guard let unwrappedVCList = viewControllers else { return }
//        setupTabBar(with: unwrappedVCList)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupTabBar(with: unwrappedVCList)
        setupTabBar()
        setupTabBarStyle(
            backgroundColor: .systemBackground,
            normalItemColor: .systemGray,
            selectedItemColor: .systemOrange
        )
    }
    
    private func setupTabBar() {
        var navigationControllers = [UINavigationController]()
       // guard let unwrappedVCList = viewControllers else { return }
        viewControllers?.forEach { vc in
            let navController = UINavigationController(rootViewController: vc)
            navigationControllers.append(navController)
        }
        self.viewControllers = navigationControllers
    }
}
