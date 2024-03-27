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


    private let posts = Posts.getPosts()


    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    } ()



    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .white

        setupUI()
        setupTable()
    }

    private func setupUI() {
        view.addSubview(tableView)
        setupConstraints()
    }

    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide

        let constraints: [NSLayoutConstraint] = [
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }



    private func setupTable() {
        tableView.delegate   = self
        tableView.dataSource = self

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44

        if #available(iOS 15.0, *) {
                   tableView.sectionHeaderTopPadding = 0.0
            }

        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.cellId)

        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.cellId)

        tableView.setAndLayout(headerView: profileHeader)
    }

}


extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            1
        } else {
            posts.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0  && indexPath.row == 0  {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.cellId, for: indexPath) as? PhotosTableViewCell
            else {
                return UITableViewCell()
            }
            return cell

        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.cellId, for: indexPath) as? PostTableViewCell
            else {
                return UITableViewCell()
            }

            cell.updateData(post: posts[indexPath.row])

            return cell
        }

        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        " "
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PhotosViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}
