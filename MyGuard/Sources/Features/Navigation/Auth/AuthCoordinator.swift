//
//  AuthCoordinator.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.12.2025.
//

import UIKit
import SwiftUI

final class AuthCoordinator: BaseCoordinator, Coordinator {
    
    let navigationController: UINavigationController
    
    private let loginComponent: AuthComponent
    private let recoveryComponent: RecoveryPasswordComponent
    
    init(
        scope: Any,
        navigationController: UINavigationController,
        loginComponent: AuthComponent,
        recoveryComponent: RecoveryPasswordComponent
    ) {
        self.navigationController = navigationController
        self.loginComponent = loginComponent
        self.recoveryComponent = recoveryComponent
        super.init(scope: scope)
    }
    
    func start() {
        makeLogin()
    }
    
    func handle(_ command: AuthDestinationCommand) {
        switch command {
            case .recoverPassword:
                makeRecoveryPassword()
        }
    }
}

extension AuthCoordinator {
    
    func makeLogin() {
        let store = loginComponent.store
        store.onOutput = { [weak self] command in
            switch command {
                
            }
        }
        let view = loginComponent.view
        let vc = UIHostingController(rootView: view)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.setViewControllers([vc], animated: true)
    }
    
    func makeRecoveryPassword() {
        let store = recoveryComponent.store
        store.onOutput = { [weak self] command in
            switch command {
                    
            }
        }
        let view = recoveryComponent.view
        let vc = UIHostingController(rootView: view)
        navigationController.pushViewController(vc, animated: true)
    }
}
