//
//  Feed.swift
//  Navigation
//
//  Created by Александр Ефименко on 16.07.2024.
//

import Foundation
import UIKit
import StorageService

class FeedCoordinator: Coordinator {
    lazy var rootViewController: UIViewController  = UIViewController()
    var parentCoordinator: Coordinator?
    let postViewModel = PostViewModel()


    func start() -> UIViewController {
        let feedViewModel = FeedViewModel()
        feedViewModel.onShowPost  = { post in
            self.showPost(post: post)
        }

        let posts = Posts.getPosts()


        let feedViewController = FeedViewController(viewModel: feedViewModel, posts: posts)
        feedViewController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(named: "house.fill"), tag: 0)

        let navigationController = UINavigationController(rootViewController: feedViewController)

        rootViewController = navigationController

        return navigationController
    }


    func showPost(post: Post) {
        postViewModel.onShowInfo = {
            self.showInfo()
        }

        postViewModel.onBackToRoot = {
            self.backToRoot()
        }

        let postViewController = PostViewController(viewModel: postViewModel)
        postViewController.post = post
        postViewController.modalTransitionStyle = .flipHorizontal // flipHorizontal
        postViewController.modalPresentationStyle = .fullScreen // pageSheet

        (self.rootViewController as! UINavigationController).pushViewController(postViewController, animated: true)
    }

    

    func showInfo() {
        postViewModel.onShowInfo = {
            self.showInfo()
        }

        postViewModel.onBackToRoot = {
            self.backToRoot()
        }

        let infoViewController = InfoViewController(viewModel: postViewModel)
        infoViewController.modalTransitionStyle = .coverVertical // flipHorizontal
        infoViewController.modalPresentationStyle = .pageSheet // pageSheet

        (self.rootViewController as! UINavigationController).present(infoViewController, animated: true)
    }


    func backToRoot() {
        (self.rootViewController as! UINavigationController).popViewController(animated: true)
    }

}
