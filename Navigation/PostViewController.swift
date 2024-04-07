//
//  PostViewController.swift
//  Navigation
//
//  Created by Александр Ефименко on 24.07.2023.
//

import UIKit

class PostViewController: UIViewController {
    var post: Post = Post(author: "", description: "", image: "", likes: 0, views: 0)

    override func viewDidLoad() {
        super.viewDidLoad()

        title = post.author
        view.backgroundColor = .systemGray4

        let myButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonPressed))

        navigationItem.rightBarButtonItem = myButton
    }
    

    @objc func buttonPressed() {

        let infoViewController = InfoViewController()

        infoViewController.modalTransitionStyle = .coverVertical // flipHorizontal
        infoViewController.modalPresentationStyle = .pageSheet // pageSheet

        present(infoViewController, animated: true)

    }

}
