//
//  TestUserService.swift
//  Navigation
//
//  Created by Александр Ефименко on 14.06.2024.
//

import Foundation
import UIKit

class TestUserService: UserService {

    let randomInt = Int.random(in: 0..<6)


   private let user: User = User(login: "Test", fullName: "Тестовый", status: "На отдыхе", avatar: UIImage(named: "Image14")!)


    func getUser(login: String) -> Result<User, MyError> {

        guard (1..<3).contains(randomInt) else {
            //Имитация ошибки получения юзера
            preconditionFailure("Не получен текущий пользователь")
        }

        if self.user.login == login {
            return Result.success(self.user)
        } else {
            return Result.failure(MyError.userNoneFound)
        }
    }

}



