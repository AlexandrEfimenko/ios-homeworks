//
//  LoginInspector.swift
//  Navigation
//
//  Created by Александр Ефименко on 22.06.2024.
//

import Foundation

struct LoginInspector: LoginViewControllerDelegate {
    func check(login: String, password: String) -> Bool {
        Checker.defaults.check(login: login, password: password)
    }
    

}
