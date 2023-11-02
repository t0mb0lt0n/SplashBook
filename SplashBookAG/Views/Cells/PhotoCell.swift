//
//  PhotoCell.swift
//  SplashBookAG
//
//  Created by Alexander on 06.10.2023.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    let imageView: UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()
    
    let likeImageView: UIImageView = {
        let likeImageView = UIImageView()
        likeImageView.image = UIImage(systemName: "hand.thumbsup.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        return likeImageView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupCell()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        self.contentView.addSubview(imageView)
        contentView.addSubview(likeImageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        likeImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .green
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            likeImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.bottomSpacing),
            likeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            likeImageView.widthAnchor.constraint(equalToConstant: 30),
            likeImageView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

//MARK: - Constants
extension PhotoCell {
    private enum Constants {
        static let bottomSpacing: CGFloat = 5
    }
}
