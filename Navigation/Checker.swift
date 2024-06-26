//
//  Checker.swift
//  Navigation
//
//  Created by Александр Ефименко on 22.06.2024.
//

import Foundation

final class Checker {
    static let defaults: Checker = {
       let cheker = Checker()
       return cheker
    }()

 #if DEBUG
    private let login = "Test"
    private let password = "123"
 #else
    private let login = "Alex"
    private let password = "123"
 #endif



    private init() {}

    func check(login: String, password: String) -> Bool {
        return self.login == login && self.password == password
    }

}
