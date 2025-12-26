//
//  ProfileCoordinatorComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 12/26/25.
//

import NeedleFoundation
import UIKit

protocol ProfileCoordinatorDependency: Dependency {
    var authorizationService: AuthorizationServiceProtocol { get }
}

final class ProfileCoordinatorComponent: Component<ProfileCoordinatorDependency> {
    
    lazy var navigationController: UINavigationController = {
       UINavigationController()
    }()
    
    func assemble() -> Coordinator {
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
