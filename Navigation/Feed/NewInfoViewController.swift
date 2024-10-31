//
//  NewInfoViewController.swift
//  Navigation
//
//  Created by Александр Ефименко on 31.10.2024.
//

import UIKit

struct HomeTask1 {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

struct Planet: Decodable {
    let name, rotationPeriod, orbitalPeriod, diameter: String
    let climate, gravity, terrain, surfaceWater: String
    let population: String
    let residents, films: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population, residents, films, created, edited, url
    }
}

class NewInfoViewController: UIViewController {

    private lazy var titleHW1: UILabel = {
        let view =  UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Задача 1: "
        return view
    } ()

    private lazy var titleHW2: UILabel = {
        let view =  UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Задача 2: "

        return view
    } ()


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(titleHW1)
        view.addSubview(titleHW2)

        setupConstraints()
        httpRequest()
        httpRequest2()
    }

    fileprivate func setupConstraints() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            titleHW1.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            titleHW1.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            titleHW1.heightAnchor.constraint(equalToConstant: 50),
            titleHW1.widthAnchor.constraint(equalToConstant: self.view.bounds.width),
            titleHW2.topAnchor.constraint(equalTo: titleHW1.bottomAnchor, constant: 10),
            titleHW2.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            titleHW2.heightAnchor.constraint(equalToConstant: 50),
            titleHW2.widthAnchor.constraint(equalToConstant: self.view.bounds.width)

        ])
    }

    func httpRequest() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/4")!

        let session = URLSession.shared
        let task = session.dataTask(with: url) { [weak self] (data, response, error) in

            if let error {
                print("Ошибка: \(error.localizedDescription)")
                return
            }

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                print("Код ошибки: \(httpResponse.statusCode)")
                return
            }

            guard let data else {
                print("Нет данных!")
                return
            }


            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {

                    let homeTask = HomeTask1(userId: json["userId"] as! Int, id: json["id"] as! Int, title: json["title"] as! String, completed: (json["completed"] as! Bool))

                    DispatchQueue.main.async {
                        self?.titleHW1.text! += homeTask.title
                    }
                }
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }

        }

        task.resume()

    }


    func httpRequest2() {
        let url = URL(string: "https://swapi.dev/api/planets/1")!

        let session = URLSession.shared
        let task = session.dataTask(with: url) { [weak self] (data, response, error) in

            if let error {
                print("Ошибка: \(error.localizedDescription)")
                return
            }

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                print("Код ошибки: \(httpResponse.statusCode)")
                return
            }

            guard let data else {
                print("Нет данных!")
                return
            }


            do {
                let decoder = JSONDecoder()
                let planet = try decoder.decode(Planet.self, from: data)

                DispatchQueue.main.async {
                    self?.titleHW2.text! += planet.orbitalPeriod
                }
            }
            catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        }

        task.resume()


    }
}
