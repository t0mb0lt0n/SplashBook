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
        tabBarItem.image = .editoralTabBarItemImage
    }
    
    init(
        with tabBarImage: UIImage?,
        vcTitle: String,
        viewModel: MainViewModel
    ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = vcTitle
        tabBarItem.image = tabBarImage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = MainView()
        mainView.collectionView.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupMainView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBarStyle(
            isLarge: true,
            title: .editoralTitle,
            titleColor: nil
        )
    }
    
    private func setupMainView() {
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        
        mainView.handlePage = { [weak self] in
            guard self?.viewModel.isContentDownloading == false else { return }
            self?.viewModel.findPhotos()
            print("handle page")
        }
    }
    
    private func setupViewModel() {
        viewModel.reloadClosure = { [weak self] in
            self?.updateContent()
            print("view controller updated")
        }
        viewModel.showLoading = { [weak self] in
            if $0 {
                self?.mainView.activityIndicator.startAnimating()
            } else {
                self?.mainView.activityIndicator.stopAnimating()
            }
        }
    }
    
    private func handlePagination() {
        guard !viewModel.isContentDownloading else { return }
        viewModel.findPhotos()
    }
    
    private func updateContent() {
        DispatchQueue.main.async {
            self.mainView.collectionView.reloadData()
        }
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
            assertionFailure(.cellError)
            return UICollectionViewCell()
        }
        
        cell.setupCellSubviews(for: photo) { [weak self] isContentDownloaded in
            DispatchQueue.main.async {
                self?.updateContent()
            }
            self?.updateContent()
            guard isContentDownloaded else { return }
            //self?.updateContent()
            //self?.mainView.collectionView.isHidden = false
        }
        mainView.collectionView.isHidden = false
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (mainView.collectionView.contentOffset.y >
            (mainView.collectionView.contentSize.height - mainView.collectionView.bounds.size.height)
        ) {
            handlePagination()
        }
    }
}


