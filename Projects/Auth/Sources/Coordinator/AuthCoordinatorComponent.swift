//
//  AuthCoordinatorComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.12.2025.
//

import NeedleFoundation
import UIKit
import Core

public protocol AuthCoordinatorDependency: Dependency {
    var authorizationService: AuthorizationServiceProtocol { get }
}

public final class AuthCoordinatorComponent: BootstrapComponent, AuthCoordinatorDependency {

    private let dependencies: AuthCoordinatorDependency
    
    public init(dependencies: AuthCoordinatorDependency) {
        self.dependencies = dependencies
    }
    
    lazy var navigationController: UINavigationController = {
        UINavigationController()
    }()

    public func assemble() -> Coordinator {
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

extension AuthCoordinatorComponent {
    
    public var authorizationService: AuthorizationServiceProtocol {
        dependencies.authorizationService
    }
}
