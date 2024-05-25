//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Александр Ефименко on 22.02.2024.
//

import Foundation
import UIKit
import StorageService

class PostTableViewCell: UITableViewCell {

    static let cellId = "PostTableViewCell"

    private let authorLabel: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.numberOfLines = 2
       label.font = .systemFont(ofSize: 20, weight: .bold)
       label.textColor = .black

       return label
    } ()

    private let descriptionLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray

       return label
    } ()

    private let imageV: UIImageView = {
       let image = UIImageView()
       image.translatesAutoresizingMaskIntoConstraints = false
       image.contentMode = .scaleAspectFit
       image.backgroundColor = .black

       return image
    } ()

    private let likesLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)

       return label
    } ()

    private let viewsLabel: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.font = .systemFont(ofSize: 16, weight: .regular)

       return label
    } ()




    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func setupUI() {
        addSubview(authorLabel)
        addSubview(imageV)
        addSubview(descriptionLabel)
        addSubview(likesLabel)
        addSubview(viewsLabel)

        setupConstraints()
    }

    private func setupConstraints() {
        let constraints: [NSLayoutConstraint] = [
            authorLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            authorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            imageV.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant:  1),
            imageV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            imageV.heightAnchor.constraint(equalToConstant: 200),

            descriptionLabel.topAnchor.constraint(equalTo:   imageV.bottomAnchor, constant: 1),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),


            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            likesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            likesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),

            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            viewsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),

        ]

        NSLayoutConstraint.activate(constraints)
    }


    func updateData(post: Post) {
        authorLabel.text = post.author
        descriptionLabel.text = post.description
        imageV.image = UIImage(named: post.image)
        likesLabel.text =  "Likes: " + String(post.likes)
        viewsLabel.text =  "Views: " + String(post.views)
    }

}
