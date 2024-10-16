//
//  Posts.swift
//  Navigation
//
//  Created by Александр Ефименко on 22.02.2024.
//

import Foundation
import StorageService

class Posts {

    static func getPosts() -> [Post]{
        let posts = [
            Post(author: "Иван", description: "Apple выпустила гарнитуру Vision Pro. Обзор" , image: "My", likes: 5, views: 5),
            Post(author: "Академия наук", description: "В Российской академии наук запущен масштабируемый вычислительный комплекс «Сергей Годунов», предназначенный для научных и государственных нужд. Система поддерживает как зарубежные x86-процессоры, так и отечественные чипы «Эльбрус».", image: "My", likes: 5, views: 5),
            Post(author: "Алекс", description: "Описание 3", image: "My", likes: 5, views: 5),
            Post(author: "Дима", description: "Описание 4", image:  "LogoVk", likes: 5, views: 5),
            Post(author: "Ольга", description: "Описание 5", image: "My", likes: 5, views: 5)
       ]

       return posts
    }

}
