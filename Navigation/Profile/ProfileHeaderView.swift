//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Александр Ефименко on 31.01.2024.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    var delegate: animationDelgate?

    private var statusText: String = ""

    private lazy var newV: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .lightGray

        return line
    } ()


    private lazy var avatarView: UIImageView =  {

        //let imageView = UIImageView(frame: CGRect(x: 16, y: 100, width: 100, height: 100))

        let imageView = UIImageView()

        imageView.image = UIImage(named: "My")
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true

        let tapImage = UITapGestureRecognizer(target: self, action: #selector (didTapAvatar))
        imageView.addGestureRecognizer(tapImage)

       return imageView
    }()



    private lazy var nameLabel: UILabel = {

        //let label = UILabel(frame: CGRect(x: 130, y: 100, width: 150, height: 50))
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
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

        let button = CustomButton(title: "Show status", backgroundColor: .systemBlue, titleColor: .white, action:  { print(self.statusText)} )

        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.shadowColor = UIColor.black.cgColor

        return button
    }()

    private lazy var editTitleButton: UIButton = {
        let button = CustomButton(title: "Edit title", backgroundColor: .orange, titleColor: .white, action:  { print("editTitleButton")} )

        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.shadowColor = UIColor.black.cgColor

        return button
    }()



    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(user: User) {
        self.init(frame: CGRect.zero)
        //self.currentUser = user

        translatesAutoresizingMaskIntoConstraints = false
        setupSubView(currentUser: user)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



    private func setupSubView(currentUser: User) {
        nameLabel.text = currentUser.fullName
        statusLabel.text = currentUser.status
        avatarView.image = currentUser.avatar

        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(statusButton)
        addSubview(avatarView)
    }

    override var intrinsicContentSize: CGSize {
            CGSize(
                width: UIView.noIntrinsicMetric,
                height: 44.0
            )
    }


    @objc func statusTextChanged(_ textField: UITextField) {

        if let newText = textField.text {
            statusText = newText
            statusLabel.text = statusText
        }

    }


    @objc private func didTapAvatar() {
        print("didTapAvatar")
        launchAnimationAvatar()
    }


    private func launchAnimationAvatar() {
        self.delegate?.animateView(avatarView: avatarView)
    }


    private func setupConstraints() {

        let constraints: [NSLayoutConstraint] = [
            avatarView.heightAnchor.constraint(equalToConstant: 100),
            avatarView.widthAnchor.constraint(equalToConstant: 100),
            avatarView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarView.topAnchor.constraint(equalTo: topAnchor, constant: 30),

            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            nameLabel.widthAnchor.constraint(equalToConstant: 150),
            nameLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 30),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),

            statusLabel.heightAnchor.constraint(equalToConstant: 50),
            statusLabel.widthAnchor.constraint(equalToConstant: 300),
            statusLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 30),
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),

            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.widthAnchor.constraint(equalToConstant: 220),
            statusTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 146),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 5),


            statusButton.heightAnchor.constraint(equalToConstant: 50),
            statusButton.widthAnchor.constraint(equalToConstant: 350),
            statusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            statusButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

        ]

        NSLayoutConstraint.activate(constraints)
    }

}

protocol animationDelgate: AnyObject {

    func animateView(avatarView: UIImageView)

}

