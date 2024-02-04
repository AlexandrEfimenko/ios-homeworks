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
       let imageView = UIImageView(frame: CGRect(x: 16, y: 100, width: 100, height: 100))

        imageView.image = UIImage(named: "My")
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true

       return imageView
    }()


    private let nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 130, y: 100, width: 150, height: 50))
        label.text = "Hipster Cat"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black

        return label
    }()

    private lazy var statusLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 130, y: 150, width: 300, height: 50))
        label.text = "Waiting for something ..."
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray

        return label
    }()

    private lazy var statusTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 130, y: 190, width: 220, height: 40))

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
        let button = UIButton(frame: CGRect(x: 16, y: 250, width: 350, height: 50))

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



    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubView()
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
    }

    @objc private func TapStatusButton() {
        print(statusText)
    }


    @objc func statusTextChanged(_ textField: UITextField) {

        if let newText = textField.text {
            statusText = newText
            statusLabel.text = statusText
        }

    }

}
