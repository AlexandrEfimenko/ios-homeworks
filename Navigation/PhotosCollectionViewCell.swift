//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Александр Ефименко on 19.03.2024.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    static let cellId = "PhotosCollectionViewCell"


    private enum Constants {
        // Generic layout constants
        static let spacing: CGFloat = 8.0
        static let horizontalPadding: CGFloat = 16.0

        // contentView layout constants
        static let contentViewCornerRadius: CGFloat = 4.0

        // profileImageView layout constants
        static let imageHeight: CGFloat = 180.0
    }


    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        imageView.contentMode = .scaleToFill
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        contentView.clipsToBounds = true
      //  contentView.layer.cornerRadius = Constants.contentViewCornerRadius
        contentView.backgroundColor = .white
    }

    private func setupSubviews() {
        contentView.addSubview(photoImageView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.heightAnchor.constraint(equalToConstant: Constants.imageHeight)
        ])

    }


    func updateData(image: UIImage?) {
        photoImageView.image = image
    }

}
