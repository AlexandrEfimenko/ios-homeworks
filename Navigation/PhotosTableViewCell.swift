//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Александр Ефименко on 16.03.2024.
//

import Foundation
import UIKit

class PhotosTableViewCell: UITableViewCell {

    static let cellId = "PhotosTableViewCell"
    private var constWidthView = 0.0
    private var widthPhotoImage = 0.0


    private lazy var photoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.text = "Photos"

        return label
    } ()


    private lazy var photoImage1: UIImageView = {
       let image = UIImageView()
       image.image = UIImage(named: "Car")
       image.translatesAutoresizingMaskIntoConstraints = false
      // image.contentMode = .scaleAspectFit
       image.layer.cornerRadius = 6
       image.clipsToBounds = true

       return image
    } ()

    private lazy var photoImage2: UIImageView = {
       let image = UIImageView()
       image.image = UIImage(named: "My")
       image.translatesAutoresizingMaskIntoConstraints = false
      // image.contentMode = .scaleAspectFit
       image.layer.cornerRadius = 6
       image.clipsToBounds = true

       return image
    } ()

    private lazy var photoImage3: UIImageView = {
       let image = UIImageView()
       image.image = UIImage(named: "wmelon")
       image.translatesAutoresizingMaskIntoConstraints = false
       //image.contentMode = .scaleAspectFit
       image.layer.cornerRadius = 6
       image.clipsToBounds = true

       return image
    } ()


    private lazy var photoImage4: UIImageView = {
       let image = UIImageView()
       image.image = UIImage(named: "dog1")
       image.translatesAutoresizingMaskIntoConstraints = false
       //image.contentMode = .scaleAspectFit
       image.layer.cornerRadius = 6
       image.clipsToBounds = true

       return image
    } ()



    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        constWidthView = contentView.frame.width
        widthPhotoImage = (constWidthView + 24) / 4

        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupUI() {
        addSubview(photoLabel)
        addSubview(photoImage1)
        addSubview(photoImage2)
        addSubview(photoImage3)
        addSubview(photoImage4)

        setupConstraints()
    }

    private func setupConstraints() {
        let constraints: [NSLayoutConstraint] = [
            photoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            photoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            photoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),


            photoImage1.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            photoImage1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            photoImage1.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            photoImage1.heightAnchor.constraint(equalToConstant: widthPhotoImage),
            photoImage1.widthAnchor.constraint(equalToConstant: widthPhotoImage),

            photoImage2.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            photoImage2.leadingAnchor.constraint(equalTo: photoImage1.trailingAnchor, constant: 8),
            photoImage2.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            photoImage2.heightAnchor.constraint(equalToConstant: widthPhotoImage),
            photoImage2.widthAnchor.constraint(equalToConstant: widthPhotoImage),

            photoImage3.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            photoImage3.leadingAnchor.constraint(equalTo: photoImage2.trailingAnchor, constant: 8),
            photoImage3.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            photoImage3.heightAnchor.constraint(equalToConstant: widthPhotoImage),
            photoImage3.widthAnchor.constraint(equalToConstant: widthPhotoImage),

            photoImage4.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            photoImage4.leadingAnchor.constraint(equalTo: photoImage3.trailingAnchor, constant: 8),
            photoImage4.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            photoImage4.heightAnchor.constraint(equalToConstant: widthPhotoImage),
            photoImage4.widthAnchor.constraint(equalToConstant: widthPhotoImage)


        ]

        NSLayoutConstraint.activate(constraints)
    }
}
