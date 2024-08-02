//
//  FeedViewModel.swift
//  Navigation
//
//  Created by Александр Ефименко on 17.07.2024.
//

import Foundation

protocol FeedVM {
    func check(word: String) -> Bool
}

class FeedViewModel : FeedVM {
    func check(word: String) -> Bool {
        return word == FeedModel.getSecretWord()
    }

}
