//
//  Feed.swift
//  Navigation
//
//  Created by Александр Ефименко on 16.07.2024.
//

import Foundation
import UIKit

class FeedCoordinator: Coordinator {
    lazy var rootViewController: UIViewController  = UIViewController()
    var parentCoordinator: Coordinator?

    func start() -> UIViewController {
        let feedViewModel = FeedViewModel()
        let feedViewController = FeedViewController(viewModel: feedViewModel)
        feedViewController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(named: "house.fill"), tag: 0)

        let navigationController = UINavigationController(rootViewController: feedViewController)

        rootViewController = navigationController

        return navigationController
    }
    

}
