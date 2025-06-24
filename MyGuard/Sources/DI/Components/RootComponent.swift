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
        RootViewModel(authorizationService: authorizationService)
    }
    
    var rootView: some View {
        RootView(viewModel: rootViewModel, authBuilder: authComponent)
    }
}

// MARK: - Dependencies
extension RootComponent {
    var networkServiceComponent: NetworkServiceComponent {
        NetworkServiceComponent(parent: self)
    }
    
    var networkService: NetworkServiceProtocol {
        networkServiceComponent.networkService
    }
    
    var authorizationServiceComponent: AuthorizationServiceComponent {
        AuthorizationServiceComponent(parent: self)
    }
    
    var authorizationService: AuthorizationServiceProtocol {
        authorizationServiceComponent.authorizationService
    }
}

// MARK: - Auth component
extension RootComponent {
    var authComponent: AuthComponent {
        return AuthComponent(parent: self)
    }
}
