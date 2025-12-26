//
//  AppCoordinatorComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.12.2025.
//

import NeedleFoundation
import UIKit
import UDFKit

final class AppCoordinatorComponent: BootstrapComponent {
    
    func appObserver(store: Store<RootReducer>, coordinator: AppCoordinator) -> AppObserver {
        AppObserver(store: store, coordinator: coordinator)
    }
    
    func appCoordinator(_ window: UIWindow?) -> AppCoordinator {
        AppCoordinator(
            scope: self,
            window: window,
            rootCoordinator: rootCoordinator,
            authCoordinator: authCoordinator,
            createPassCodeComponent: createPassCodeComponent,
            inputPassCodeComponent: inputPassCodeComponent
        )
    }
}

extension AppCoordinatorComponent {
    
    // MARK: Network Service
    private var networkServiceComponent: NetworkServiceComponent {
        NetworkServiceComponent(parent: self)
    }
    
    var networkService: NetworkServiceProtocol {
        networkServiceComponent.networkService
    }
    
    /// Authorization network service
    var authNetworkComponent: AuthNetworkComponent {
        AuthNetworkComponent(parent: self)
    }
    
    var authNetworkService: AuthNetworkProtocol {
        authNetworkComponent.authNetworkService
    }
    
    // MARK: Authorization Service
    private var authorizationServiceComponent: AuthorizationServiceComponent {
        AuthorizationServiceComponent(parent: self)
    }
    
    var authorizationService: AuthorizationServiceProtocol {
        authorizationServiceComponent.authorizationService
    }
    var authorizationState: AuthorizationStateProtocol {
        authorizationService as AuthorizationStateProtocol
    }
    
    // MARK: Navigation Service
    private var navigationServiceComponent: NavigationServiceComponent {
        NavigationServiceComponent(parent: self)
    }
    
    var navigationService: NavigationServiceProtocol {
        navigationServiceComponent.navigationService
    }
}

extension AppCoordinatorComponent {
    
    var rootComponent: RootComponent {
        RootComponent(parent: self)
    }
    
    var rootCoordinatorComponent: RootCoordinatorComponent {
        RootCoordinatorComponent(parent: self)
    }
    
    var rootCoordinator: TabBar {
        rootCoordinatorComponent.assemble()
    }
    
    var authCoordinatorComponent: AuthCoordinatorComponent {
        AuthCoordinatorComponent(parent: self)
    }
    
    var authCoordinator: Coordinator {
        authCoordinatorComponent.assemble()
    }
    
    var createPassCodeComponent: CreatePassCodeComponent {
        CreatePassCodeComponent(parent: self)
    }
    
    var inputPassCodeComponent: InputPassCodeComponent {
        InputPassCodeComponent(parent: self)
    }
}
