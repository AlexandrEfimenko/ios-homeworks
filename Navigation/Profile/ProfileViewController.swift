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
    }
    

    override func viewWillLayoutSubviews() {
        profileHeader.frame = view.frame
    }


}
