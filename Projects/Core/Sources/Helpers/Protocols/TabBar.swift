//
//  TabBar.swift
//  Core
//
//  Created by Иван Спирин on 12/27/25.
//

import UIKit

public protocol TabBarProto: AnyObject {
    var tabBarController: UITabBarController { get }
    
    func start()
}
