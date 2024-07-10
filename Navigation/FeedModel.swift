//
//  FeedModel.swift
//  Navigation
//
//  Created by Александр Ефименко on 10.07.2024.
//

import Foundation

class FeedModel {
    private static let secretWord = "Apple"

    static func check(word: String) -> Bool {
        return word == secretWord
    }

}
