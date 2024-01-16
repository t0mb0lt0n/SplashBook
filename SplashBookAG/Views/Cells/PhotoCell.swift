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
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let authorNameLabel: UILabel = {
        let label = UILabel()
        label.text = .defaultAuthorName
        label.textColor = .white
        label.font = .systemFont(ofSize: Constants.authorNameFontSize, weight: .semibold)
        return label
    }()
    
    private let likeImage: UIImageView = {
        let imageView = UIImageView()
        let likeImage = UIImage(
            systemName: "heart"
        )?.withTintColor(
            .systemOrange,
            renderingMode: .alwaysOriginal
        )
        imageView.image = likeImage
        return imageView
    }()
    
    private let likeCountLabel: UILabel = {
        let label = UILabel()
        //label.text = "10000"
        label.textColor = .systemOrange
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupCell()
        setupConstraints()
    }
    
    override func prepareForReuse() {
        imageView.image = nil
        super.prepareForReuse()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        [imageView,
         authorNameLabel,
         likeImage,
         likeCountLabel
        ].forEach { subview in
            contentView.addSubview(subview)
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        backgroundColor = .green
    }
    
    func setupCellSubviews(for image: UnsplashPhoto) {
        //self.imageView.loadImageAsync(from: image.urls.small)
        self.authorNameLabel.text = image.unsplashUser.name
        self.likeCountLabel.text = "\(image.likes)"
        self.imageView.loadImageAsync(from: image.urls.small)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.imageViewBottomSpacing),
            
            authorNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.authorNameBottomSpacing),
            authorNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.authorNameLeadingSpacing),
            authorNameLabel.widthAnchor.constraint(equalToConstant: Constants.authorNameWidth),
            authorNameLabel.heightAnchor.constraint(equalToConstant: Constants.authorNameHeight),
            
            likeImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.authorNameBottomSpacing),
            likeImage.leadingAnchor.constraint(equalTo: authorNameLabel.trailingAnchor, constant: 5),
            likeImage.widthAnchor.constraint(equalToConstant: 14),
            likeImage.heightAnchor.constraint(equalToConstant: 14),
            
            likeCountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.authorNameBottomSpacing),
            likeCountLabel.leadingAnchor.constraint(equalTo: likeImage.trailingAnchor, constant: 3),
            likeCountLabel.widthAnchor.constraint(equalToConstant: 100),
            likeCountLabel.heightAnchor.constraint(equalToConstant: 14),
        ])
    }
}

//MARK: - Constants

extension PhotoCell {
    private enum Constants {
        static let imageViewBottomSpacing: CGFloat = 0
        static let authorNameBottomSpacing: CGFloat = -5
        static let authorNameLeadingSpacing: CGFloat = 0
        static let authorNameWidth: CGFloat = 120
        static let authorNameHeight: CGFloat = 14
        static let authorNameFontSize: CGFloat = 14
    }
}
