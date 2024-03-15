//
//  ReusableCollectionView.swift
//  SplashBookAG
//
//  Created by Alexander on 14.03.2024.
//

import UIKit

final class ReusableCollectionView: UICollectionView {
    func setupCollectionView() {
        register(UINib?, forCellWithReuseIdentifier: <#T##String#>)
        self.collectionViewLayout
    }
    
    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = Constants.lineSpacing
        layout.minimumInteritemSpacing = Constants.interItemSpacing
        
        return layout
    }
    


}

extension 
