//
//  MainView.swift
//  SplashBookAG
//
//  Created by Alexander on 05.10.2023.
//

import UIKit

class MainView: UIView {
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()


    init() {
        super.init(frame: .zero)
        
       
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
