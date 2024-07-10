//
//  InfoViewController.swift
//  Navigation
//
//  Created by Александр Ефименко on 24.07.2023.
//

import UIKit

class InfoViewController: UIViewController {

    private lazy var myButton: UIButton = {

        let button = CustomButton(title: "Alert", backgroundColor: nil, titleColor: .systemBlue, 
            action:  {

            let alert = UIAlertController(title: "Понравилось ДЗ?", message: "Доп описание", preferredStyle: .actionSheet)

            alert.addAction(UIAlertAction(title: "Да", style: .default, handler: {action in print("Вы нажали: \(action.title!)")}))
            alert.addAction(UIAlertAction(title: "Нет", style: .destructive, handler: {action in print("Вы нажали: \(action.title!)")}))
            alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: {action in print("Вы нажали: \(action.title!)"); self.dismiss(animated: true)}))

            self.present(alert, animated: true)

            }
        )

           return button
       }()

    private lazy var buttonClose: UIButton = {
        let button = CustomButton(title: "Close", backgroundColor: nil, titleColor: .yellow,
            action:  {

            self.dismiss(animated: true)
          }
        )

           return button
       }()



    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Info"
        view.backgroundColor = .magenta

        view.addSubview(myButton)
        view.addSubview(buttonClose)

        сonstraintButton()
    }


    fileprivate func сonstraintButton() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            myButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 20.0
            ),
            myButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -20.0
            ),
            myButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            myButton.heightAnchor.constraint(equalToConstant: 80.0)
        ])

        NSLayoutConstraint.activate([
            buttonClose.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 20.0
            ),
            buttonClose.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -20.0
            ),

            buttonClose.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 10),

            buttonClose.heightAnchor.constraint(equalToConstant: 60.0)

        ])
    }

}
