//
//  FeedViewController.swift
//  Navigation
//
//  Created by Александр Ефименко on 24.07.2023.
//

import UIKit
import StorageService

class FeedViewController: UIViewController {

    private lazy var postButton: UIButton = {
           let button = UIButton()
           button.translatesAutoresizingMaskIntoConstraints = false
           button.setTitle("Пост 1", for: .normal)
           button.setTitleColor(.systemBlue, for: .normal)

           button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

           return button
       }()

    private lazy var button2: UIButton = {
           let button = UIButton()
           button.translatesAutoresizingMaskIntoConstraints = false
           button.setTitle("Пост 2", for: .normal)
           button.setTitleColor(.systemBlue, for: .normal)

           button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

           return button
       }()

    private lazy var stackView: UIStackView = {
           let stack = UIStackView()
           stack.translatesAutoresizingMaskIntoConstraints = false
           stack.axis = .vertical

           stack.addArrangedSubview(postButton)
           stack.addArrangedSubview(button2)
           stack.spacing = 10

           return stack
       }()



    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Лента"
        view.backgroundColor = .lightGray

        view.addSubview(stackView)
        setupConstraints()
    }
    

    @objc func buttonPressed(_ sender: UIButton) {
        let posts = Posts.getPosts()

        let post: Post = posts[0]

        let postViewController = PostViewController()
        postViewController.post = post
        postViewController.modalTransitionStyle = .flipHorizontal // flipHorizontal
        postViewController.modalPresentationStyle = .fullScreen // pageSheet

        navigationController?.pushViewController(postViewController, animated: true)
      }
    

    fileprivate func setupConstraints() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
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

