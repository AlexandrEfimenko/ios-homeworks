//
//  CurrentUserService.swift
//  Navigation
//
//  Created by Александр Ефименко on 12.06.2024.
//

import Foundation
import UIKit

class CurrentUserService: UserService {

    private let user: User = User(login: "Alex", fullName: "Alexandr", status: "На отдыхе", avatar: UIImage(named: "Nature")!)


    func getUser(login: String) -> Result<User, MyError>   {

        if self.user.login == login {
            return Result.success(self.user)
        } else {
            return Result.failure(MyError.userNoneFound)
        }

    }

}

