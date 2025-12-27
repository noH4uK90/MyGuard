//
//  Coordinator.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.12.2025.
//

import UIKit

public protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    
    func start()
}
