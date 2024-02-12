//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Александр Ефименко on 31.01.2024.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {

    private var statusText: String = ""

    private let avatarView: UIImageView =  {
        //let imageView = UIImageView(frame: CGRect(x: 16, y: 100, width: 100, height: 100))

        let imageView = UIImageView()

        imageView.image = UIImage(named: "My")
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

       return imageView
    }()


    private let nameLabel: UILabel = {
        //let label = UILabel(frame: CGRect(x: 130, y: 100, width: 150, height: 50))
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hipster Cat"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black

        return label
    }()

    private lazy var statusLabel: UILabel = {
        //let label = UILabel(frame: CGRect(x: 130, y: 150, width: 300, height: 50))
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Waiting for something ..."
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray

        return label
    }()

    private lazy var statusTextField: UITextField = {
      //  let textField = UITextField(frame: CGRect(x: 130, y: 190, width: 220, height: 40))

        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = ""
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.placeholder = "Введите статус..."
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 12

        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)

        return textField
    }()


    private lazy var statusButton: UIButton = {
        //let button = UIButton(frame: CGRect(x: 16, y: 250, width: 350, height: 50))

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)

        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.shadowColor = UIColor.black.cgColor

        button.addTarget(self, action: #selector(TapStatusButton), for: .touchUpInside)

        return button
    }()

    private lazy var editTitleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .orange
        button.setTitle("Edit title", for: .normal)
        button.setTitleColor(.white, for: .normal)

        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.shadowColor = UIColor.black.cgColor

        button.addTarget(self, action: #selector(TapEditTitleButton), for: .touchUpInside)

        return button
    }()



    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupSubView() {
        addSubview(avatarView)
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(statusButton)
        addSubview(statusTextField)
        addSubview(editTitleButton)
    }

    @objc private func TapStatusButton() {
        print(statusText)
    }

    @objc private func TapEditTitleButton() {
        print("test")
    }


    @objc func statusTextChanged(_ textField: UITextField) {

        if let newText = textField.text {
            statusText = newText
            statusLabel.text = statusText
        }

    }


    private func setupConstraints() {
        let safeArea = safeAreaLayoutGuide

        let constraints: [NSLayoutConstraint] = [
            avatarView.heightAnchor.constraint(equalToConstant: 100),
            avatarView.widthAnchor.constraint(equalToConstant: 100),
            avatarView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            avatarView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 30),

            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            nameLabel.widthAnchor.constraint(equalToConstant: 150),
            nameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 130),
            nameLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 30),

            statusLabel.heightAnchor.constraint(equalToConstant: 50),
            statusLabel.widthAnchor.constraint(equalToConstant: 300),
            statusLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 15),
            statusLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 16),
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),

            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.widthAnchor.constraint(equalToConstant: 220),
            statusTextField.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 15),
            statusTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 5),


            statusButton.heightAnchor.constraint(equalToConstant: 50),
            statusButton.widthAnchor.constraint(equalToConstant: 350),
            statusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            statusButton.bottomAnchor.constraint(equalTo: statusButton.topAnchor),
            statusButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),

            editTitleButton.heightAnchor.constraint(equalToConstant: 30),
            editTitleButton.widthAnchor.constraint(equalToConstant: 350),
            editTitleButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            editTitleButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            editTitleButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }

}
