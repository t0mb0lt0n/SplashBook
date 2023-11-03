//
//  PhotoCell.swift
//  SplashBookAG
//
//  Created by Alexander on 06.10.2023.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let authorNameLabel: UILabel = {
        let label = UILabel()
        label.text = .defaultAuthorName
        label.textColor = .white
        label.backgroundColor = .green
        return label
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
        [imageView,
         authorNameLabel].forEach { subview in
            contentView.addSubview(subview)
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        backgroundColor = .green
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            authorNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.bottomSpacing),
            authorNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            authorNameLabel.widthAnchor.constraint(equalToConstant: 150),
            authorNameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            likeImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.bottomSpacing),
            likeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            likeImageView.widthAnchor.constraint(equalToConstant: 150),
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
