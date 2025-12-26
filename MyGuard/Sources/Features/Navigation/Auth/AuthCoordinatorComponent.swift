//
//  AuthCoordinatorComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.12.2025.
//

import NeedleFoundation
import UIKit

protocol AuthCoordinatorDependency: Dependency {
    var authorizationService: AuthorizationServiceProtocol { get }
}

final class AuthCoordinatorComponent: Component<AuthCoordinatorDependency> {

    lazy var navigationController: UINavigationController = {
        UINavigationController()
    }()

    func assemble() -> Coordinator {
        AuthCoordinator(
            scope: self,
            navigationController: navigationController,
            loginComponent: loginComponent,
            recoveryComponent: recoveryPasswordComponent
        )
    }
}

extension AuthCoordinatorComponent {

    var loginComponent: AuthComponent {
        AuthComponent(parent: self)
    }

    var recoveryPasswordComponent: RecoveryPasswordComponent {
        RecoveryPasswordComponent(parent: self)
    }
}
