//
//  ProfileModelView.swift
//  Navigation
//
//  Created by Александр Ефименко on 25.07.2024.
//

import Foundation
import StorageService

protocol ProfileViewModelProtocol {
    func getCurrentUser(login: String) -> User?
    func getPosts() -> [Post]
    var onShowProfileView:  ( () ->Void )?  { get set }
    var onBackToRoot: (()->Void)? { get set }
    var isLogin: Bool { get set }
}



class ProfileViewModel: ProfileViewModelProtocol {
    var onShowProfileView:  ( () ->Void )?  
    var onBackToRoot:  ( () ->Void )?
    var isLogin = false

    var currentUser: User?

    func getCurrentUser(login: String) -> User? {
      #if DEBUG
        let userService = TestUserService()
      #else
        let userService = CurrentUserService()
     #endif

    let result: Result = userService.getUser(login: login)

        switch result {
        case .success(let user):
            self.currentUser = user
        case .failure(_):
            return nil
        }

        return self.currentUser
    }
    
    
    func getPosts() -> [Post] {
        Posts.getPosts()
    }



}
