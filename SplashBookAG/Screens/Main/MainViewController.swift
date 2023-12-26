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
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = .editoralTitle
        tabBarItem.image = UIImage(systemName: Constants.systemImageCameraFill)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.changeNavigationBarStyle(
            to: Constants.systemColorOrange
        )
        view = MainView()
        view.backgroundColor = .secondarySystemBackground
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        setupViewModel()
        viewModel.findPhotos()
    }
    
    private func setupViewModel() {
        viewModel.reloadClosure = { [weak self] in
            self?.updateContent()
        }
    }
    
    private func updateContent() {
        mainView.collectionView.reloadData()
    }
}

//MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        viewModel.numberOfItems
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        let photo = viewModel.photos[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "\(PhotoCell.self)",
            for: indexPath
        ) as? PhotoCell else {
            fatalError("Cell dequeue error")
        }
        cell.setupCellSubviews(for: photo)
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        print("Cell Selected")
    }
}

extension MainViewController {
    private enum Constants {
        static let systemColorOrange: UIColor = .systemOrange
        static let systemColorDefaultWhite: UIColor = .white
        static let systemImageCameraFill: String = "camera.fill"
    }
}


