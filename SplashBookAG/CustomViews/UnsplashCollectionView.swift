//
//  ReusableCollectionView.swift
//  SplashBookAG
//
//  Created by Alexander on 14.03.2024.
//

import UIKit

class UnsplashCollectionView: UICollectionView {
    init() {
        super .init(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout()
        )
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollectionView() {
        alwaysBounceVertical = true
        backgroundColor = .systemBackground
        register(
            PhotoCell.self,
            forCellWithReuseIdentifier: "\(PhotoCell.self)"
        )
        collectionViewLayout = setupFlowLayout()
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

// MARK: - Constants

extension UnsplashCollectionView {
    private enum Constants {
        static let lineSpacing: CGFloat = 1
        static let interItemSpacing: CGFloat = 1
    }
}
