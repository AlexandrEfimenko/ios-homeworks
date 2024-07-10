//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Александр Ефименко on 24.07.2023.
//

import UIKit
import iOSIntPackage

class ProfileViewController: UIViewController {

    private var currentUser: User?

    var profileHeader: ProfileHeaderView

    private var avatarViewCenterOrigin = CGPoint()
    private var avatarViewOld = UIImageView()


    lazy var  animationView: UIView = {
        let animationView = UIView()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.backgroundColor = .white
        animationView.frame = view.frame
        animationView.alpha = 1.0

        return animationView
    }()


    private lazy var hiddenAnimateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        button.backgroundColor = .systemGray
        button.setTitle("X", for: .normal)
        button.alpha = 0.0
        button.layer.cornerRadius = 25

        /*
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.shadowColor = UIColor.black.cgColor
         */

        button.addTarget(self, action: #selector(TapHiddenAnimateButton), for: .touchUpInside)

        return button
    }()



    private let posts = Posts.getPosts()


    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false

      #if DEBUG
        table.backgroundColor = .systemPink
      #else
        table.backgroundColor = .white
      #endif

        return table
    } ()


    init(currentUser: User) {
        self.currentUser = currentUser

        self.profileHeader = ProfileHeaderView(user: currentUser)

        super.init(nibName: nil, bundle: nil)
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"

       #if DEBUG
        view.backgroundColor = .systemPink
       #else
        view.backgroundColor = .white
       #endif

        setupUI()
        setupTable()
    }

    private func setupUI() {

        view.addSubview(animationView)

        animationView.addSubview(tableView)
        animationView.addSubview(hiddenAnimateButton)

        profileHeader.delegate = self

        setupConstraints()
    }

    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide

        let constraints: [NSLayoutConstraint] = [

            animationView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            animationView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            animationView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            animationView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),

            tableView.leadingAnchor.constraint(equalTo: animationView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: animationView.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: animationView.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: animationView.bottomAnchor),

            /*
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),


            animationView.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            animationView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            animationView.topAnchor.constraint(equalTo: tableView.topAnchor),
            animationView.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
           */
            hiddenAnimateButton.topAnchor.constraint(equalTo: animationView.topAnchor, constant: 10),
            hiddenAnimateButton.trailingAnchor.constraint(equalTo: animationView.trailingAnchor, constant: -10),
            hiddenAnimateButton.heightAnchor.constraint(equalToConstant: 50),
            hiddenAnimateButton.widthAnchor.constraint(equalToConstant: 50),
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
        let publisherFacade = ImagePublisherFacade()
        let vc = PhotosViewController(imagePublisherFacade: publisherFacade)
        navigationController?.pushViewController(vc, animated: true)
    }


    @objc private func TapHiddenAnimateButton() {
        print("TapHiddenAnimateButton")
        animateViewRecive()
    }

}

extension ProfileViewController: animationDelgate{
    func animateView(avatarView: UIImageView) {
        let centerOrigin = avatarView.center

        self.avatarViewOld = avatarView
        self.avatarViewCenterOrigin = centerOrigin


        UIView.animateKeyframes(
            withDuration: 1.0,
            delay: 0.0,
            options: .calculationModeCubic,
            animations: {

                // 1
                UIView.addKeyframe(
                    withRelativeStartTime: 0.0,
                    relativeDuration: 0.5
                ) {
                    avatarView.center = CGPoint(
                        x: centerOrigin.x * 3,
                        y: centerOrigin.y * 6
                    )


                    avatarView.transform = CGAffineTransform(
                        scaleX: 5,
                        y: 4
                    )

                    avatarView.layer.cornerRadius = 0
                    self.animationView.alpha = 0.5
                    avatarView.alpha = 1.0
                }

                // 2
                UIView.addKeyframe(
                    withRelativeStartTime: 0.5,
                    relativeDuration: 0.3
                ) {
                    self.hiddenAnimateButton.isHidden = false
                    self.hiddenAnimateButton.alpha = 1.0
                }


            },
            completion: { finished in
                print("Did finish animateView()")
            })
    }
    
    func animateViewRecive() {

        UIView.animateKeyframes(
            withDuration: 1.0,
            delay: 0.0,
            options: .calculationModeCubic,
            animations: {

                // 1
                UIView.addKeyframe(
                    withRelativeStartTime: 0.0,
                    relativeDuration: 0.5
                ) {
                    self.avatarViewOld.center = self.avatarViewCenterOrigin

                    self.avatarViewOld.transform = CGAffineTransform(
                        scaleX: 1,
                        y: 1
                    )

                    self.avatarViewOld.layer.cornerRadius = 50
                    self.avatarViewOld.alpha = 1.0
                    self.animationView.alpha = 1.0
                }

                // 2
                UIView.addKeyframe(
                    withRelativeStartTime: 0.5,
                    relativeDuration: 0.3
                ) {
                    self.hiddenAnimateButton.alpha = 0.1
                    self.hiddenAnimateButton.isHidden = true
                }


            },
            completion: { finished in
                print("Did finish animateViewRecive()")
            })


    }


}
