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
}



class ProfileViewModel: ProfileViewModelProtocol {

    var currentUser: User?

    func getCurrentUser(login: String) -> User? {
      #if DEBUG
        let userService = TestUserService()
      #else
        let userService = CurrentUserService()
     #endif

       self.currentUser = userService.getUser(login: login)

       return self.currentUser
    }
    
    
    func getPosts() -> [Post] {
        Posts.getPosts()
    }


}
