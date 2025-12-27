//
//  TabBarCoordinatorComponent.swift
//  TabBar
//
//  Created by Иван Спирин on 12/27/25.
//

import NeedleFoundation
import UIKit
import Core
import Passwords
import Analytics
import Profile

public protocol TabBarCoordinatorDependency: Dependency {
    var networkService: NetworkServiceProtocol { get }
    var authorizationService: AuthorizationServiceProtocol { get }
}

public final class TabBarCoordinatorComponent: BootstrapComponent {

    private let dependencies: TabBarCoordinatorDependency

    public init(dependencies: TabBarCoordinatorDependency) {
        self.dependencies = dependencies
    }

    lazy var tabBarController: UITabBarController = {
        UITabBarController()
    }()

    public func assemble() -> TabBarProto {
        TabBarCoordinator(
            scope: self,
            tabBarController: tabBarController,
            passwordListCoordinator: passwordCoordinator,
            analyticsCoordinator: analyticsCoordinator,
            profileCoordinator: profileCoordinator
        )
    }
}

extension TabBarCoordinatorComponent: PasswordCoordinatorDependency {
    
    var passwordCoordinatorComponent: PasswordCoordinatorComponent {
        PasswordCoordinatorComponent(dependencies: self)
    }
    
    var passwordCoordinator: Coordinator {
        passwordCoordinatorComponent.assemble()
    }
}

extension TabBarCoordinatorComponent {
    
    var analyticsCoordinatorComponent: AnalyticsCoordinatorComponent {
        AnalyticsCoordinatorComponent()
    }
    
    var analyticsCoordinator: Coordinator {
        analyticsCoordinatorComponent.assemble()
    }
}

extension TabBarCoordinatorComponent: ProfileCoordinatorDependency {
    
    var profileCoordinatorComponent: ProfileCoordinatorComponent {
        ProfileCoordinatorComponent(dependencies: self)
    }
    
    var profileCoordinator: Coordinator {
        profileCoordinatorComponent.assemble()
    }
}

extension TabBarCoordinatorComponent {

    public var networkService: NetworkServiceProtocol {
        dependencies.networkService
    }

    public var authorizationService: AuthorizationServiceProtocol {
        dependencies.authorizationService
    }
}
