//
//  MainView.swift
//  SplashBookAG
//
//  Created by Alexander on 05.10.2023.
//

import UIKit

final class MainView: UIView {
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        
        return collectionView
    }()
    
    init() {
        super.init(frame: .zero)
        setupCollectionView()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupCompositionalLayout())
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "\(PhotoCell.self)")
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .secondarySystemBackground
        
    }
    
    private func setupViews() {
        [collectionView].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(subView)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Constants.borderSpacing),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Constants.borderSpacing),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: Constants.itemWidth, height: Constants.itemHeight)
        layout.minimumLineSpacing = Constants.lineSpacing
        layout.minimumInteritemSpacing = Constants.interItemSpacing
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        return layout
    }
    
    func setupCompositionalLayout() -> UICollectionViewCompositionalLayout {
        //Item
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(2/3),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 3,
            leading: 3,
            bottom:3,
            trailing: 3
        )
        
        let verticalStackItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/2)
            )
        )
        //Group
        let verticalStackGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)
            ),
            repeatingSubitem: verticalStackItem,
            count: 2
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(3/5)
            ),
            subitems: [
                item,
                verticalStackGroup
            ]
        )
        
//        let group = NSCollectionLayoutGroup.horizontal(
//            layoutSize: NSCollectionLayoutSize(
//                widthDimension: .fractionalWidth(1),
//                heightDimension: .fractionalHeight(2/5)
//            ),
//            subitem: item,
//            count: 2
//        )
        //Sections
        let section = NSCollectionLayoutSection(group: group)
        //Return
        return UICollectionViewCompositionalLayout(section: section)
    }
}

//MARK: - Constants

extension MainView {
    private enum Constants {
        static let borderSpacing: CGFloat = 1
        static let lineSpacing: CGFloat = 1
        static let interItemSpacing: CGFloat = 1
        static let itemWidth: CGFloat = 50
        static let itemHeight: CGFloat = 50
    }
}
