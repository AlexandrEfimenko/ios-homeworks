//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Александр Ефименко on 24.07.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    var profileHeader: ProfileHeaderView = {
       let headerView = ProfileHeaderView()
       return headerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        view.backgroundColor = .lightGray
        view.addSubview(profileHeader)
        setupConstraints()
    }
    

    override func viewWillLayoutSubviews() {
       profileHeader.frame = view.frame
    }


    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide

        let constraints: [NSLayoutConstraint] = [
            profileHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeader.heightAnchor.constraint(equalToConstant: 220),
            profileHeader.topAnchor.constraint(equalTo: safeArea.topAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }

}
