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
    
    override func loadView() {
        super.viewDidLoad()
        view = MainView()
        //imageView.loadImageAsync(from: image.urls.small)
        setupMainView()
        setupViewModel()
        viewModel.findPhotos()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.changeNavigationBarStyle(
            to: Constants.systemColorOrange
        )
        view.backgroundColor = .secondarySystemBackground
        //viewModel.findPhotos()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func viewDidLayoutSubviews() {

    }
    
    private func setupMainView() {
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
    }
    private func setupViewModel() {
        viewModel.reloadClosure = { [weak self] in
            self?.updateContent()
            print("reload closure")
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
        cell.setupCellSubviews(for: photo) { isDownloaded in
            self.viewModel.isContentDownloaded = isDownloaded
        }
        //collectionView.reloadData()
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
}

//MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        updateContent()
    }
}

extension MainViewController {
    private enum Constants {
        static let systemColorOrange: UIColor = .systemOrange
        static let systemColorDefaultWhite: UIColor = .white
        static let systemImageCameraFill: String = "camera.fill"
    }
}


