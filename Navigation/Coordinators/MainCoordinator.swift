//
//  MainCoordinator.swift
//  Navigation
//
//  Created by Александр Ефименко on 16.07.2024.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    lazy var rootViewController: UIViewController = UITabBarController()
    lazy var feedCoordinator  = FeedCoordinator()
    lazy var loginCoordinator = LoginCoordinator()


    func start() -> UIViewController {
        feedCoordinator.parentCoordinator = self
        loginCoordinator.parentCoordinator = self

        let feedViewController = feedCoordinator.start()
        let loginViewController = loginCoordinator.start()
        let navigationControllers = [feedViewController, loginViewController]


        let tabBarController = UITabBarController()
        tabBarController.viewControllers = navigationControllers
        tabBarController.selectedIndex = 1

        rootViewController = tabBarController
        return rootViewController
    }
   
}




