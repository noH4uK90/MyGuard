//
//  InputPassCodeComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 06.07.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit
import Core

public protocol InputPassCodeDependency: Dependency {
    var authorizationService: AuthorizationServiceProtocol { get }
}

public final class InputPassCodeComponent: BootstrapComponent, InputPassCodeDependency {
    
    private let dependencies: InputPassCodeDependency
    
    public init(dependencies: InputPassCodeDependency) {
        self.dependencies = dependencies
    }
    
    var store: Store<InputPassCodeReducer> {
        let safeDependency = ThreadSafe(dependencies)
        let reducer = InputPassCodeReducer(dependency: safeDependency)
        return Store(state: InputPassCodeReducer.State(), reducer: reducer)
    }
    
    public var view: some View {
        InputPassCodeView(store: store)
    }
}

extension InputPassCodeComponent {
    
    public var authorizationService: AuthorizationServiceProtocol {
        dependencies.authorizationService
    }
}
