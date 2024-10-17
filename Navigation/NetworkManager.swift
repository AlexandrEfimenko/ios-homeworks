//
//  NetworkManager.swift
//  Navigation
//
//  Created by Александр Ефименко on 17.10.2024.
//

import Foundation

enum AppConfiguration {
    case one
    case two
    case three

    var url: String {
        switch self {
        case .one:
            return "https://swapi.dev/api/people/8"
        case .two:
            return"https://swapi.dev/api/starships/3"
        case .three:
            return "https://swapi.dev/api/planets/5"
        }
    }
}

enum NetworkError: Error, CustomStringConvertible {
    case notInternet(Error)
    case badResponse(URLResponse)
    case badStatusCode(Int)
    case noData
    case somethingWentWrong

    var description: String {
        switch self {
        case .notInternet(let error):
            return "Нет интернета: \(error.localizedDescription)"
        case .badResponse(let response):
            return "Не верный формат ответа. Response: \(response.debugDescription)"
        case .badStatusCode(let code):
            return "Код ошибки - \(code)"
        case .noData:
            return "Данные не получены"
        case .somethingWentWrong:
            return "Произошла неизвестная ошибка"
        }
    }
}


struct NetworkManager {
    static func request(for configuration: AppConfiguration) {
        let url = URL(string: configuration.url+"s")!

        let session = URLSession.shared
        let task = session.dataTask(with: url) {data, response, error in

            if let error {
                print(NetworkError.notInternet(error))
                return
            }


            guard let response = response as? HTTPURLResponse  else {
                print(NetworkError.badResponse)
                return
            }

            guard (200..<300).contains(response.statusCode) else {
                print(NetworkError.badStatusCode(response.statusCode))
                print("Content-Type: \(String(describing: response.allHeaderFields["Content-Type"]))")
                return
            }

            guard let data else {
                print(NetworkError.noData)
                return
            }


            do {
                guard let answer = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {return}

               // let value = answer["name"] as? String
                print("answer:  \(answer.description)")
            } catch {
                print(NetworkError.somethingWentWrong)
            }
        }

        task.resume()

    }
}
