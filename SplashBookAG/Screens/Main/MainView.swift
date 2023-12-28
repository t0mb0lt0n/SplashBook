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
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: setupFlowLayout()
        )
        collectionView.register(
            PhotoCell.self,
            forCellWithReuseIdentifier: "\(PhotoCell.self)"
        )
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
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        //layout.itemSize = .init(width: Constants.itemWidth, height: Constants.itemHeight)
        layout.minimumLineSpacing = Constants.lineSpacing
        layout.minimumInteritemSpacing = Constants.interItemSpacing
        return layout
    }
    
    func setupCompositionalLayout() -> UICollectionViewCompositionalLayout {
        //Item
        let singleItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(130),
                heightDimension: .absolute(200)
            )
        )
        
        let dubleItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(300),
                heightDimension: .absolute(200)
            )
        )
        
        singleItem.contentInsets = NSDirectionalEdgeInsets(
            top: 3,
            leading: 3,
            bottom: 3,
            trailing: 3
        )
        //Group
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(200)
            ),
            subitems: [
                singleItem,
                dubleItem
            ]
        )
        let section = NSCollectionLayoutSection(group: group)
        let compositionLayout = UICollectionViewCompositionalLayout(section: section)
        return compositionLayout
    }
}

//MARK: - Constants

extension MainView {
    private enum Constants {
        static let borderSpacing: CGFloat = 1
        static let lineSpacing: CGFloat = 1
        static let interItemSpacing: CGFloat = 1
        static let itemWidth: CGFloat = 200
        static let itemHeight: CGFloat = 300
    }
}
