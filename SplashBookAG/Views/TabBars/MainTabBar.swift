//
//  MainTabBar.swift
//  SplashBookAG
//
//  Created by Alexander on 31.10.2023.
//

import Foundation
import UIKit

final class MainTabBar: UITabBarController {
    private var vcList: [UIViewController]
    //private lazy var mainTabBarVC: UIViewController
    
    init(with list: [UIViewController] ) {
        self.vcList = list
        //viewControllers = list
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar(with: vcList)
        setupTabBarStyle()
    }
    
    private func setupTabBar(with viewControllers: [UIViewController]) {
        var navigationControllerList: [UINavigationController] = []
        viewControllers.forEach { vc in
            let navController = createNavigationControler(vc: vc,
                                                          itemTitle: vc.title ?? "EmptyName",
                                                          itemImageName: "camera.fill")
            navigationControllerList.append(navController)
        }
        let vcOne = MainViewController(viewModel: .init())
        //let vc = view
        self.viewControllers = navigationControllerList
    }
}
