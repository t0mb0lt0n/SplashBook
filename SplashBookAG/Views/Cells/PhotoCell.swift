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
        //imageView.contentMode = .scaleAspectFit
        //imageView.layer.cornerRadius = 20
        //imageView.clipsToBounds = true
        return imageView
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
        //imageView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //imageView.translatesAutoresizingMaskIntoConstraints = false
        //imageView.contentMode = .scaleAspectFill
        //imageView.backgroundColor = .black
        //layer.cornerRadius = 20
        backgroundColor = .green
        //contentMode = .scaleAspectFill
        //self.clipsToBounds = true
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
        ])
    }
}
