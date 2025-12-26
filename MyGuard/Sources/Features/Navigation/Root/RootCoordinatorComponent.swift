//
//  RootCoordinatorComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.12.2025.
//

import NeedleFoundation
import UIKit

protocol RootCoordinatorDependency: Dependency {
    var networkService: NetworkServiceProtocol { get }
    var authorizationService: AuthorizationServiceProtocol { get }
}

final class RootCoordinatorComponent: Component<RootCoordinatorDependency> {
    
    lazy var tabController: UITabBarController = {
        UITabBarController()
    }()
    
    func assemble() -> TabBar {
        RootCoordinator(
            scope: self,
            tabBarController: tabController,
            passwordListCoordinator: passwordCoordinator,
            analyticsCoordinator: analyticsCoordinator,
            profileCoordinator: profileCoordinator
        )
    }
}

extension RootCoordinatorComponent {
    
    /// Folder network service
    var folderNetworkComponent: FolderNetworkComponent {
        FolderNetworkComponent(parent: self)
    }
    
    var folderNetworkService: FolderNetworkProtocol {
        folderNetworkComponent.folderNetworkService
    }
    
    /// Password network service
    var passwordNetworkComponent: PasswordNetworkComponent {
        PasswordNetworkComponent(parent: self)
    }
    
    var passwordNetworkService: PasswordNetworkProtocol {
        passwordNetworkComponent.passwordNetworkService
    }
}

extension RootCoordinatorComponent: PasswordCoordinatorDependency {
    
    var passwordCoordinatorComponent: PasswordCoordinatorComponent {
        PasswordCoordinatorComponent(parent: self)
    }
    
    var passwordCoordinator: Coordinator {
        passwordCoordinatorComponent.assemble()
    }
    
    var analyticsCoordinatorComponent: AnalyticsCoordinatorComponent {
        AnalyticsCoordinatorComponent(parent: self)
    }
    
    var analyticsCoordinator: Coordinator {
        analyticsCoordinatorComponent.assemble()
    }
    
    var profileCoordinatorComponent: ProfileCoordinatorComponent {
        ProfileCoordinatorComponent(parent: self)
    }
    
    var profileCoordinator: Coordinator {
        profileCoordinatorComponent.assemble()
    }
    
}
