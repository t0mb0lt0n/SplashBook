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
        view = MainView()
        view.backgroundColor = .secondarySystemBackground
        mainView.collectionView.dataSource = self
      //try? HTTPRequest.HTTPRequestConfuguration(with: "https://", method: .get, initialURL: "")
      let a = try! HTTPRequest.composeURL(with: "https://", server: "randomuser.me", endPoint: "/api")
        //print(type(of: a!))
        var b = URLComposer()
        b.a = 2
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
        
        DispatchQueue.main.async {
            guard let image = UIImage(named: self.viewModel.source[indexPath.item].imageName) else {
                print("missed image")
                return
            }
            cell.setupSubviews(
                imageView: image,
                authorNameLabel: .defaultAuthorName
            )
        }
        return cell
    }
}
