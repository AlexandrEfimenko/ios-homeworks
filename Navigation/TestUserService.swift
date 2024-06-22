//
//  TestUserService.swift
//  Navigation
//
//  Created by Александр Ефименко on 14.06.2024.
//

import Foundation
import UIKit

class TestUserService: UserService {

    private let user: User = User(login: "Test", fullName: "Тестовый", status: "На отдыхе", avatar: UIImage(named: "Image14")!)


    func getUser(login: String) -> User? {
         self.user.login == login  ?  self.user : nil
    }

}



