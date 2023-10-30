//
//  MainViewController.swift
//  SplashBookAG
//
//  Created by Alexander on 05.10.2023.
//

import UIKit

final class MainViewController: UIViewController {
    private lazy var mainView = view as! MainView
    private let viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = MainView()
        view.backgroundColor = .secondarySystemBackground
    }

    // MARK:


}
