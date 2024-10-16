//
//  MyLoginFactory.swift
//  Navigation
//
//  Created by Александр Ефименко on 22.06.2024.
//

import Foundation

struct MyLoginFactory: LoginFactory {
    func makeLoginInspector()  -> LoginInspector {
        LoginInspector()
    }
    
}
