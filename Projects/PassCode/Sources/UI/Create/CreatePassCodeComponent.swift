//
//  CreatePassCodeComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 07.07.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit
import Core

public protocol CreatePassCodeDependency: Dependency {
    var authorizationService: AuthorizationServiceProtocol { get }
}

public final class CreatePassCodeComponent: BootstrapComponent, CreatePassCodeDependency {
    
    private let dependencies: CreatePassCodeDependency
    
    public init(dependencies: CreatePassCodeDependency) {
        self.dependencies = dependencies
    }
    
    var store: Store<CreatePassCodeReducer> {
        let safeDependency = ThreadSafe(dependencies)
        let reducer = CreatePassCodeReducer(dependency: safeDependency)
        return Store(state: CreatePassCodeReducer.State(), reducer: reducer)
    }
    
    public var view: some View {
        CreatePassCodeView(store: store)
    }
}

extension CreatePassCodeComponent {
    
    public var authorizationService: AuthorizationServiceProtocol {
        dependencies.authorizationService
    }
}
