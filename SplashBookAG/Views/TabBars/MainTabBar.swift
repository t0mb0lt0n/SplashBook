//
//  MainTabBar.swift
//  SplashBookAG
//
//  Created by Alexander on 31.10.2023.
//

import Foundation
import UIKit

final class MainTabBar: UITabBarController {
    private let vcList: [UIViewController]
    
    init(with list: [UIViewController] ) {
        super.init(nibName: nil, bundle: nil)
        self.vcList = list
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        //viewControllers =
    }
    
    private func setupTabBar() {
        
    }
    
    //private func
}
