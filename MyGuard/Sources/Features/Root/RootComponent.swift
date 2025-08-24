//
//  RootComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 19.06.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit

final class RootComponent: BootstrapComponent, RootDependency {
    
//    @MainActor
//    var rootViewModel: RootViewModel {
//        RootViewModel(authorizationService: authorizationService, navigationService: navigationService)
//    }
    
    @MainActor
    var store: Store<RootReducer> {
        let safeDependency = ThreadSafe(self as RootDependency)
        return Store(state: RootReducer.State(), reducer: RootReducer(dependency: safeDependency))
    }
    
    @MainActor
    var rootView: some View {
        print("Root view")
        return RootView(
            store: store,
            authBuilder: authComponent,
            analyticsBuilder: analyticsComponent,
            profileBuilder: profileComponent,
            passwordListBuilder: passwordListComponent,
            inputPassCodeBuilder: inputPassCodeComponent,
            createPassCodeBuilder: createPassCodeComponent
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

// MARK: - Input pass code component
extension RootComponent {
    var inputPassCodeComponent: InputPassCodeComponent {
        InputPassCodeComponent(parent: self)
    }
}

// MARK: - Create pass code component
extension RootComponent {
    var createPassCodeComponent: CreatePassCodeComponent {
        CreatePassCodeComponent(parent: self)
    }
}
