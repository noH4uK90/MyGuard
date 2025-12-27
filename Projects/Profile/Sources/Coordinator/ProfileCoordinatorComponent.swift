//
//  ProfileCoordinatorComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 12/26/25.
//

import NeedleFoundation
import UIKit
import Core

public protocol ProfileCoordinatorDependency: Dependency {
    var authorizationService: AuthorizationServiceProtocol { get }
}

public final class ProfileCoordinatorComponent: BootstrapComponent, ProfileCoordinatorDependency {
    
    private let dependencies: ProfileCoordinatorDependency
    
    public init(dependencies: ProfileCoordinatorDependency) {
        self.dependencies = dependencies
    }
    
    lazy var navigationController: UINavigationController = {
       UINavigationController()
    }()
    
    public func assemble() -> Coordinator {
        ProfileCoordinator(
            scope: self,
            navigationController: navigationController,
            profileComponent: profileComponent
        )
    }
}

extension ProfileCoordinatorComponent {
    
    var profileComponent: ProfileComponent {
        ProfileComponent(parent: self)
    }
}

extension ProfileCoordinatorComponent {
    
    public var authorizationService: AuthorizationServiceProtocol {
        dependencies.authorizationService
    }
}
