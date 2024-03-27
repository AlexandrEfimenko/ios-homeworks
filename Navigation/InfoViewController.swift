//
//  InfoViewController.swift
//  Navigation
//
//  Created by Александр Ефименко on 24.07.2023.
//

import UIKit

class InfoViewController: UIViewController {

    private lazy var myButton: UIButton = {
           let button = UIButton()
           button.translatesAutoresizingMaskIntoConstraints = false
           button.setTitle("Alert", for: .normal)
           button.setTitleColor(.systemBlue, for: .normal)

           button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

           return button
       }()

    private lazy var buttonClose: UIButton = {
           let button = UIButton()
           button.translatesAutoresizingMaskIntoConstraints = false
           button.setTitle("Close", for: .normal)
           button.setTitleColor(.yellow, for: .normal)

           button.addTarget(self, action: #selector(buttonPressedClose(_:)), for: .touchUpInside)

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
    

    @objc func buttonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Понравилось ДЗ?", message: "Доп описание", preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: {action in print("Вы нажали: \(action.title!)")}))
        alert.addAction(UIAlertAction(title: "Нет", style: .destructive, handler: {action in print("Вы нажали: \(action.title!)")}))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: {action in print("Вы нажали: \(action.title!)"); self.dismiss(animated: true)}))

        present(alert, animated: true)
    }


    @objc func buttonPressedClose(_ sender: UIButton) {
       dismiss(animated: true)
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
