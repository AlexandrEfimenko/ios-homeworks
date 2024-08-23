//
//  Login.swift
//  Navigation
//
//  Created by Александр Ефименко on 16.07.2024.
//

import Foundation
import UIKit

class ProfileCoordinator: Coordinator {
    lazy var rootViewController: UIViewController = UIViewController()
    var parentCoordinator: Coordinator?
    let profileViewModel = ProfileViewModel()

    func start() -> UIViewController {
        let loginFactory = MyLoginFactory()

        profileViewModel.onShowProfileView = { self.showProfileViewController() }
        profileViewModel.onBackToRoot = { self.backToLoginView() }

        let loginViewController = LogInViewController(profileModelView: profileViewModel)
        loginViewController.loginDelegate = loginFactory.makeLoginInspector()
        loginViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "person.fill"), tag: 1)

        let navigationController = UINavigationController(rootViewController: loginViewController)
        rootViewController = navigationController

        return navigationController
    }



    func showProfileViewController() {
        let profileViewController = ProfileViewController(profileModelView: profileViewModel)
        (self.rootViewController as! UINavigationController).pushViewController(profileViewController, animated: true)
    }

    func backToLoginView() {
        (self.rootViewController as! UINavigationController).popViewController(animated: true)
    }

}
