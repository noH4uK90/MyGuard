//
//  AuthorizationServiceComponent.swift
//  App
//
//  Created by Иван Спирин on 12/27/25.
//

import NeedleFoundation
import Core

protocol AuthorizationServiceDependency: Dependency {
    var authNetworkService: AuthNetworkProtocol { get }
}

final class AuthorizationServiceComponent: Component<AuthorizationServiceDependency> {
    
    var authorizationService: AuthorizationServiceProtocol {
        shared { AuthorizationServiceAssembly().assemble(authNetwork: dependency.authNetworkService) }
    }
}
