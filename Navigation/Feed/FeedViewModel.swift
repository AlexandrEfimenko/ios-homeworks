//
//  FeedViewModel.swift
//  Navigation
//
//  Created by Александр Ефименко on 17.07.2024.
//

import Foundation
import StorageService

protocol FeedVM {
    var onShowPost: ((_: Post)->Void)? { get set }
    func check(word: String) -> Bool
}

class FeedViewModel : FeedVM {
    var onShowPost: ((_: Post) -> Void)?

    func check(word: String) -> Bool {
        return word == FeedModel.getSecretWord()
    }

}
