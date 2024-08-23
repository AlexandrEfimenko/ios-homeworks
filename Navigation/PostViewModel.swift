//
//  PostViewModel.swift
//  Navigation
//
//  Created by Александр Ефименко on 16.08.2024.
//

import Foundation

protocol PostVM {
    var onShowInfo: (()->Void)? { get set }
    var onBackToRoot: (()->Void)? { get set }
}

class PostViewModel : PostVM {
    var onShowInfo: (() -> Void)?
    var onBackToRoot: (() -> Void)?

}
