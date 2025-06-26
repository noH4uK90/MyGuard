//
//  RootComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 19.06.2025.
//

import NeedleFoundation
import SwiftUI

final class RootComponent: BootstrapComponent {
    
    var rootViewModel: RootViewModel {
        RootViewModel(authorizationService: authorizationService, navigationService: navigationService)
    }
    
    var rootView: some View {
        RootView(
            viewModel: rootViewModel,
            authBuilder: authComponent,
            analyticsBuilder: analyticsComponent,
            profileBuilder: profileComponent,
            passwordListBuilder: passwordListComponent
        )
    }
}

// MARK: - Dependencies
extension RootComponent {
    // MARK: Network Service
    private var networkServiceComponent: NetworkServiceComponent {
        NetworkServiceComponent(parent: self)
    }
    
    var networkService: NetworkServiceProtocol {
        networkServiceComponent.networkService
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

// MARK: - Auth component
extension RootComponent {
    var authComponent: AuthComponent {
        AuthComponent(parent: self)
    }
}

// MARK: - Analytics component
extension RootComponent {
    var analyticsComponent: AnalyticsComponent {
        AnalyticsComponent(parent: self)
    }
}

// MARK: - Profile component
extension RootComponent {
    var profileComponent: ProfileComponent {
        ProfileComponent(parent: self)
    }
}

// MARK: - Password list component
extension RootComponent {
    var passwordListComponent: PasswordListComponent {
        PasswordListComponent(parent: self)
    }
}
