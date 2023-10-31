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
    
    init(with list: [UIViewController] ) {
        self.vcList = list
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        //viewControllers =
    }
    
    private func setupTabBar(with viewControllers: inout [UIViewController]) {
        viewControllers.forEach { vc in
            <#code#>
        }
    }
    
//    private func createNavigationControler(vc: UIViewController,
//                                           itemName: String,
//                                           itemImageName: String) -> UINavigationController {
//        
//        
//    }
}
