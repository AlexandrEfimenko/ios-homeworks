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

           return button
       }()


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
            myButton.heightAnchor.constraint(equalToConstant: 44.0)
        ])
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Info"
        view.backgroundColor = .magenta

        view.addSubview(myButton)

        сonstraintButton()

        myButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
    

    @objc func buttonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Понравилось ДЗ?", message: "Доп описание", preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: {action in print("Вы нажали: \(action.title!)")}))
        alert.addAction(UIAlertAction(title: "Нет", style: .destructive, handler: {action in print("Вы нажали: \(action.title!)")}))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: {action in print("Вы нажали: \(action.title!)")}))

        present(alert, animated: true)
    }

}
