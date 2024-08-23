//
//  LoginViewControllerDelegate.swift
//  Navigation
//
//  Created by Александр Ефименко on 22.06.2024.
//

import Foundation

protocol LoginViewControllerDelegate {
   func check(login: String, password: String) -> Bool
}


