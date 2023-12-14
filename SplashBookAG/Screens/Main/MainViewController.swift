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
        tabBarItem.image = UIImage(systemName: "camera.fill")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.changeNavigationBarStyle(
            to: Constants.systemOrange
        )
        view = MainView()
        view.backgroundColor = .secondarySystemBackground
        mainView.collectionView.dataSource = self
        setupViewModel()
        viewModel.findPhotos()
        print("------viewDidLoad--------\(viewModel.photos.count)")
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
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "\(PhotoCell.self)",
            for: indexPath
        ) as? PhotoCell else {
            fatalError("Cell dequeue error")
        }
        
        let urlStr = URL(string: viewModel.photos[indexPath.row].urls.small)
        guard let data: Data = try? Data(contentsOf: urlStr!) else {
            print("cell empty")
            return cell }
        guard  let image = UIImage(data: data) else {
            print("cell empty")
            return cell}
        
        let authorName = viewModel.photos[indexPath.row].unsplashUser.name ?? "default author name"
        
        cell.setupSubviews(
            imageView: image,
            authorNameLabel: authorName
        )
        return cell
    }
}

extension MainViewController {
    private enum Constants {
        static let systemColorOrange: UIColor = .systemOrange
        static let systemColorDefaultWhite: UIColor = .white
        
    }
}


