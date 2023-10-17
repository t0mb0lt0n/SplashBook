//
//  MainViewController.swift
//  SplashBookAG
//
//  Created by Alexander on 05.10.2023.
//

import UIKit

class MainViewController: UIViewController {
    private lazy var mainView = view as! MainView

    override func viewDidLoad() {
        super.viewDidLoad()
        view = MainView()
        view.backgroundColor = .secondarySystemBackground
    }

    // MARK: 


}
