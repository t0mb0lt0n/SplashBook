//
//  PhotoCell.swift
//  SplashBookAG
//
//  Created by Alexander on 06.10.2023.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let authorNameLabel: UILabel = {
        let label = UILabel()
        label.text = .defaultAuthorName
        label.textColor = .white
        label.font = .systemFont(ofSize: Constants.authorNameFontSize, weight: .semibold)
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
         authorNameLabel
        ].forEach { subview in
            contentView.addSubview(subview)
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        backgroundColor = .green
    }
    
    func setupSubviews(imageView: UIImage, authorNameLabel: String) {
        self.imageView.image = imageView
        self.authorNameLabel.text = authorNameLabel
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            authorNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.authorNameBottomSpacing),
            authorNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.authorNameLeadingSpacing),
            authorNameLabel.widthAnchor.constraint(equalToConstant: Constants.authorNameWidth),
            authorNameLabel.heightAnchor.constraint(equalToConstant: Constants.authorNameHeight),
        ])
    }
}

//MARK: - Constants
extension PhotoCell {
    private enum Constants {
        static let authorNameBottomSpacing: CGFloat = 5
        static let authorNameLeadingSpacing: CGFloat = 5
        static let authorNameWidth: CGFloat = 150
        static let authorNameHeight: CGFloat = 14
        static let authorNameFontSize: CGFloat = 14
    }
}
