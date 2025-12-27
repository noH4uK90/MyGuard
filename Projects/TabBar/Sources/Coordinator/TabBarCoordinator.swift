//
//  TabBarCoordinator.swift
//  TabBar
//
//  Created by Иван Спирин on 12/27/25.
//

import UIKit
import Core

final class TabBarCoordinator: BaseCoordinator, TabBarProto {
    
    let tabBarController: UITabBarController
    
    private let passwordListCoordinator: Coordinator
    private let analyticsCoordinator: Coordinator
    private let profileCoordinator: Coordinator
    
    init(
        scope: Any,
        tabBarController: UITabBarController,
        passwordListCoordinator: Coordinator,
        analyticsCoordinator: Coordinator,
        profileCoordinator: Coordinator
    ) {
        self.tabBarController = tabBarController
        self.passwordListCoordinator = passwordListCoordinator
        self.analyticsCoordinator = analyticsCoordinator
        self.profileCoordinator = profileCoordinator
        super.init(scope: scope)
    }
    
    func start() {
        setupTabBarItems()
        tabBarController.viewControllers = [passwordListCoordinator.navigationController, analyticsCoordinator.navigationController, profileCoordinator.navigationController]
        
        passwordListCoordinator.start()
        analyticsCoordinator.start()
        profileCoordinator.start()
    }
    
    func setupTabBarItems() {
        
        makePasswordListTab()
        makeAnalyticsTab()
        makeProfileTab()
    }
    
}

extension TabBarCoordinator {
    
    private func makePasswordListTab() {
        var passwordTabBarItem: UITabBarItem!
        if #available(iOS 26, *) {
            passwordTabBarItem = UITabBarItem(title: "Passwords", image: UIImage(systemName: "key.shield"), tag: 0)
        } else {
            passwordTabBarItem = UITabBarItem(title: "Passwords", image: UIImage(systemName: "key"), tag: 0)
        }
        passwordListCoordinator.navigationController.tabBarItem = passwordTabBarItem
    }
    
    private func makeAnalyticsTab() {
        let analyticsTabBarItem = UITabBarItem(title: "Analytics", image: UIImage(systemName: "chart.bar"), tag: 1)
        analyticsCoordinator.navigationController.tabBarItem = analyticsTabBarItem
    }
    
    private func makeProfileTab() {
        let profileTabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 2)
        profileCoordinator.navigationController.tabBarItem = profileTabBarItem
    }
}
