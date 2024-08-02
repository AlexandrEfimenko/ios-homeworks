//
//  Login.swift
//  Navigation
//
//  Created by Александр Ефименко on 16.07.2024.
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator {
    lazy var rootViewController: UIViewController = UIViewController()
    var parentCoordinator: Coordinator?

    func start() -> UIViewController {
        let loginFactory = MyLoginFactory()

        let loginViewController = LogInViewController()

        loginViewController.loginDelegate = loginFactory.makeLoginInspector()
        loginViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "person.fill"), tag: 1)

        let navigationController = UINavigationController(rootViewController: loginViewController)

        rootViewController = navigationController

        return navigationController
    }


}
