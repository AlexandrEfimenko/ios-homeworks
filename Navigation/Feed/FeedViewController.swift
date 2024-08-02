//
//  FeedViewController.swift
//  Navigation
//
//  Created by Александр Ефименко on 24.07.2023.
//

import UIKit
import StorageService

class FeedViewController: UIViewController {

    let viewModel: FeedViewModel

    private lazy var postButton = CustomButton(title: "Пост 1", backgroundColor: nil, titleColor: .systemBlue,
            action:  {
            let posts = Posts.getPosts()
            let post: Post = posts[0]

            let postViewController = PostViewController()
            postViewController.post = post
            postViewController.modalTransitionStyle = .flipHorizontal // flipHorizontal
            postViewController.modalPresentationStyle = .fullScreen // pageSheet

            self.navigationController?.pushViewController(postViewController, animated: true)
           }
        )


    private lazy var button2 = CustomButton(title: "Пост 2", backgroundColor: nil, titleColor: .systemBlue,
            action:  {
            let posts = Posts.getPosts()
            let post: Post = posts[1]

            let postViewController = PostViewController()
            postViewController.post = post
            postViewController.modalTransitionStyle = .flipHorizontal // flipHorizontal
            postViewController.modalPresentationStyle = .fullScreen // pageSheet

            self.navigationController?.pushViewController(postViewController, animated: true)
           }
        )



    private lazy var stackView: UIStackView = {
           let stack = UIStackView()
           stack.translatesAutoresizingMaskIntoConstraints = false
           stack.axis = .vertical

           stack.addArrangedSubview(postButton)
           stack.addArrangedSubview(button2)
           stack.spacing = 10

           return stack
       }()


     private lazy var passwordTitle: UILabel = {
           let view = UILabel()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.text = "Пароль:"
           return view
       }()

    private lazy var passwordView: UITextField = {
           let view = UITextField()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.placeholder = "Введите пароль..."
           view.layer.borderWidth = 2.0
           return view
       }()

    private lazy var passwordCheckLabel: UILabel = {
           let view = UILabel()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.textColor = .red
           return view
       }()


    private lazy var checkGuessButton = CustomButton(title: "check Guess", backgroundColor: .systemBlue, titleColor: .white,
            action:  {

            if let textPassword = self.passwordView.text {
                let isValid = self.viewModel.check(word: textPassword)

                if isValid {
                    self.passwordCheckLabel.text = "пароль верный"
                    self.passwordCheckLabel.textColor = .green
                } else {
                    self.passwordCheckLabel.text = "пароль не верный"
                    self.passwordCheckLabel.textColor = .red
                }

            } else {
                self.passwordCheckLabel.text = "пароль пустой"
                self.passwordCheckLabel.textColor = .red
            }

           }
        )



    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Лента"
        view.backgroundColor = .white

        view.addSubview(passwordTitle)
        view.addSubview(passwordView)
        view.addSubview(passwordCheckLabel)
        view.addSubview(checkGuessButton)
        view.addSubview(stackView)
        setupConstraints()
    }
    


    fileprivate func setupConstraints() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            passwordTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5.0),
            passwordTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10.0),
            passwordTitle.widthAnchor.constraint(equalToConstant: 70),

            passwordView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10.0),
            passwordView.leadingAnchor.constraint(equalTo: passwordTitle.trailingAnchor, constant: 5.0),
            passwordView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10.0),
            passwordView.widthAnchor.constraint(equalToConstant: 100),

            checkGuessButton.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 10.0),
            checkGuessButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),

            passwordCheckLabel.topAnchor.constraint(equalTo: checkGuessButton.bottomAnchor, constant: 10.0),
            passwordCheckLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),

            stackView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 10.0
            ),
            stackView.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -10.0
            ),
            stackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

