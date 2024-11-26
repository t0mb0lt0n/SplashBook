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
        label.font = .systemFont(
            ofSize: Constants.authorNameFontSize,
            weight: .semibold
        )
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
        label.textColor = .systemOrange
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupCell()
        setupConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
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
    }
    
    func setupCellSubviews(
        for image: UnsplashPhoto,
        completion: @escaping (Bool) -> Void?
    ) {
        self.imageView.loadImageAsync(
            from: image.urls.small,
            completion: completion
        )
        self.authorNameLabel.text = image.unsplashUser.name
        self.likeCountLabel.text = "\(image.likes)"
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: Constants.imageViewBottomSpacing
            ),
            
            authorNameLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: Constants.authorNameBottomSpacing
            ),
            authorNameLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.authorNameLeadingSpacing
            ),
            authorNameLabel.widthAnchor.constraint(equalToConstant: Constants.authorNameWidth),
            authorNameLabel.heightAnchor.constraint(equalToConstant: Constants.authorNameHeight),
            
            likeImage.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: Constants.likeImageBottomSpacing
            ),
            likeImage.trailingAnchor.constraint(
                equalTo: likeCountLabel.leadingAnchor,
                constant: Constants.likeImageTralingSpacing
            ),
            likeImage.widthAnchor.constraint(equalToConstant: Constants.likeImageWidth),
            likeImage.heightAnchor.constraint(equalToConstant: Constants.likeImageHeight),
            
            likeCountLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: Constants.likeCountLabelBottomSpacing
            ),
            likeCountLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constants.likeCountLabelLeadingSpacing
            ),
            likeCountLabel.widthAnchor.constraint(equalToConstant: Constants.likeCountLabelWidth),
            likeCountLabel.heightAnchor.constraint(equalToConstant: Constants.likeCountLabelHeight),
        ])
    }
}

//MARK: - Constants

extension PhotoCell {
    private enum Constants {
        static let imageViewBottomSpacing: CGFloat = 0
        static let authorNameBottomSpacing: CGFloat = -10
        static let authorNameLeadingSpacing: CGFloat = 5
        static let authorNameWidth: CGFloat = 120
        static let authorNameHeight: CGFloat = 14
        static let authorNameFontSize: CGFloat = 14
        static let likeImageWidth: CGFloat = 14
        static let likeImageHeight: CGFloat = 14
        static let likeImageTralingSpacing: CGFloat = -5
        static let likeImageBottomSpacing: CGFloat = -10
        static let likeCountLabelWidth: CGFloat = 45
        static let likeCountLabelHeight: CGFloat = 14
        static let likeCountLabelLeadingSpacing: CGFloat = -5
        static let likeCountLabelBottomSpacing: CGFloat = -10
    }
}
