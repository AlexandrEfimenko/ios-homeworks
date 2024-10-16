//
//  Coordinator.swift
//  Navigation
//
//  Created by Александр Ефименко on 16.07.2024.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    //var coordinators: [Coordinator]  {get set}
    var rootViewController: UIViewController { get set }
    var parentCoordinator: Coordinator? { get set }
    func start() -> UIViewController
}
