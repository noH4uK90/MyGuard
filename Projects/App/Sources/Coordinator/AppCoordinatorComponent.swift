//
//  AppCoordinatorComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.12.2025.
//

import NeedleFoundation
import UIKit
import UDFKit
import Core
import TabBar
import PassCode
import Auth

final class AppCoordinatorComponent: BootstrapComponent {
    
    func appObserver(store: Store<AppReducer>, coordinator: AppCoordinator) -> AppObserver {
        AppObserver(store: store, coordinator: coordinator)
    }
    
    func appCoordinator(_ window: UIWindow?) -> AppCoordinator {
        AppCoordinator(
            scope: self,
            window: window,
            tabBarCoordinator: tabBarCoordinator,
            authCoordinator: authCoordinator,
            createPassCodeComponent: createPassCodeComponent,
            inputPassCodeComponent: inputPassCodeComponent
        )
    }
}

extension AppCoordinatorComponent: NavigationServiceDependency {
    
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
        authorizationServiceComponent.authorizationService as AuthorizationStateProtocol
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
    
    var appComponent: AppComponent {
        AppComponent(parent: self)
    }
    
}
extension AppCoordinatorComponent: TabBarCoordinatorDependency {
    
    var tabBarCoordinatorComponent: TabBarCoordinatorComponent {
        TabBarCoordinatorComponent(dependencies: self)
    }
    
    var tabBarCoordinator: TabBarProto {
        tabBarCoordinatorComponent.assemble()
    }
}

extension AppCoordinatorComponent: AuthCoordinatorDependency {
    
    var authCoordinatorComponent: AuthCoordinatorComponent {
        AuthCoordinatorComponent(dependencies: self)
    }
    
    var authCoordinator: Coordinator {
        authCoordinatorComponent.assemble()
    }
}

extension AppCoordinatorComponent: CreatePassCodeDependency, InputPassCodeDependency {
    
    var createPassCodeComponent: CreatePassCodeComponent {
        CreatePassCodeComponent(dependencies: self)
    }
    
    var inputPassCodeComponent: InputPassCodeComponent {
        InputPassCodeComponent(dependencies: self)
    }
}
