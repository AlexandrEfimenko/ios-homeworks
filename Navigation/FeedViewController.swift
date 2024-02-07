//
//  FeedViewController.swift
//  Navigation
//
//  Created by Александр Ефименко on 24.07.2023.
//

import UIKit

class FeedViewController: UIViewController {

    private lazy var postButton: UIButton = {
           let button = UIButton()
           button.translatesAutoresizingMaskIntoConstraints = false
           button.setTitle("Открыть пост", for: .normal)
           button.setTitleColor(.systemBlue, for: .normal)

           button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

           return button
       }()


    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Лента"
        view.backgroundColor = .orange

        view.addSubview(postButton)

        сonstraintButton()
    }
    

    @objc func buttonPressed(_ sender: UIButton) {
        let post: Post = Post(title: "Мой первый пост")

        let postViewController = PostViewController()
        postViewController.post = post
        postViewController.modalTransitionStyle = .flipHorizontal // flipHorizontal
        postViewController.modalPresentationStyle = .fullScreen // pageSheet

        navigationController?.pushViewController(postViewController, animated: true)
      }
    

    fileprivate func сonstraintButton() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            postButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 20.0
            ),
            postButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -20.0
            ),
            postButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            postButton.heightAnchor.constraint(equalToConstant: 44.0)
        ])
    }
}

