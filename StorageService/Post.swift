//
//  Post.swift
//  Navigation
//
//  Created by Александр Ефименко on 24.07.2023.
//

import Foundation

public struct Post {
   /*
author: String никнейм автора публикации
description: String - текст публикации
image: String - имя картинки из каталога Assets.xcassets
likes: Int - количество лайков
views: Int - количество просмотров
*/
    public var author: String
    public var description: String
    public var image: String
    public var likes: Int
    public var views: Int

    public init(author: String, description: String, image: String, likes: Int, views: Int) {
        self.author = author
        self.description = description
        self.image = image
        self.likes = likes
        self.views = views
    }

}

