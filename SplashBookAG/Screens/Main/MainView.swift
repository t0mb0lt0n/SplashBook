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
    
    let source: [Photo] = Source.randomPhotos(with: 15)


    init() {
        super.init(frame: .zero)
        setupViews()
        setupCollectionView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        //collectionView.delegate = self
        collectionView.dataSource = self
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
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        //layout.
        return layout
    }
    
}

//MARK: - CollectionViewDataSource extensions

extension MainView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
