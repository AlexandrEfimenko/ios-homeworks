//
//  PostViewController.swift
//  Navigation
//
//  Created by Александр Ефименко on 24.07.2023.
//

import UIKit
import StorageService


class PostViewController: UIViewController {
    let viewModel: PostViewModel

    var post: Post = Post(author: "", description: "", image: "", likes: 0, views: 0)

    init(viewModel: PostViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()

        title = post.author
        view.backgroundColor = .systemGray4

        let buttonShowInfo   = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonPressedShowInfo))
        let buttonToRoot = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(buttonPressedToRoot))

        navigationItem.rightBarButtonItem = buttonShowInfo
        navigationItem.leftBarButtonItem = buttonToRoot
    }
    

    @objc func buttonPressedShowInfo() {
        viewModel.onShowInfo?()
    }

    @objc func buttonPressedToRoot() {
        viewModel.onBackToRoot?()
        print("back to root")
    }

}
