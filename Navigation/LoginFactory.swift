//
//  LoginFactory.swift
//  Navigation
//
//  Created by Александр Ефименко on 22.06.2024.
//

import Foundation

protocol LoginFactory {
    func makeLoginInspector()  -> LoginInspector
}
