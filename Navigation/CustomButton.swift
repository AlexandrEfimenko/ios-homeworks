//
//  CustomButton.swift
//  Navigation
//
//  Created by Александр Ефименко on 09.07.2024.
//

import UIKit

class CustomButton: UIButton {

    private var action: (() -> Void)? = nil

    convenience init(title: String, backgroundColor: UIColor?, titleColor: UIColor, action: (()-> Void)?) {

        self.init(frame: .zero)

        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)

        self.action = action
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func buttonTapped() {
        if let action = self.action {
            action()
        }
    }

}
