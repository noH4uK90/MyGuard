//
//  NavigationServiceComponent.swift
//  App
//
//  Created by Иван Спирин on 12/27/25.
//

import NeedleFoundation
import Core

protocol NavigationServiceDependency: Dependency {
    var authorizationState: AuthorizationStateProtocol { get }
}

final class NavigationServiceComponent: Component<NavigationServiceDependency> {
    
    var navigationService: NavigationServiceProtocol {
        shared { NavigationServiceAssembly().assemble(authState: dependency.authorizationState) }
    }
}
