//
//  AuthComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 19.06.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit
import Core

protocol AuthDependency: Dependency {
    var authorizationService: AuthorizationServiceProtocol { get }
}

final class AuthComponent: Component<AuthDependency> {
    
    var store: Store<AuthReducer> {
        let safeDependency = ThreadSafe(dependency!)
        let reducer = AuthReducer(dependency: safeDependency)
        return Store(state: AuthReducer.State(), reducer: reducer)
    }
    
    var view: AuthView {
        return AuthView(store: store)
    }
}
