//
//  Photos.swift
//  Navigation
//
//  Created by Александр Ефименко on 19.03.2024.
//

import Foundation
import UIKit

class Photos {

    static func getPhotos() throws -> [UIImage] {

        let randomInt = Int.random(in: 0..<6)

        guard (1..<3).contains(randomInt) else {
            throw MyError.photoNoneFound
        }

        let photos: [UIImage] = [
                     UIImage(named: "Car")!,
                     UIImage(named: "My")!,
                     UIImage(named: "dog1")!,
                     UIImage(named: "wmelon")!,
                     UIImage(named: "My")!,
                     UIImage(named: "Image1")!,
                     UIImage(named: "Nature")!,
                     UIImage(named: "Image3")!,
                     UIImage(named: "Image4")!,
                     UIImage(named: "Image5")!,
                     UIImage(named: "Image6")!,
                     UIImage(named: "Image7")!,
                     UIImage(named: "Image8")!,
                     UIImage(named: "Image9")!,
                     UIImage(named: "Image10")!,
                     UIImage(named: "Image11")!,
                     UIImage(named: "Image12")!,
                     UIImage(named: "Image13")!,
                     UIImage(named: "Image14")!,
                     UIImage(named: "Image15")!


        ]

        return photos
    }

}
