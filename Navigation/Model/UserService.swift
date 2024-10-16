//
//  UserService.swift
//  Navigation
//
//  Created by Александр Ефименко on 12.06.2024.
//

import Foundation

protocol UserService {
    func getUser(login: String) -> Result<User, MyError>
}

