//
//  AuthNetworkComponent.swift
//  App
//
//  Created by Иван Спирин on 12/27/25.
//

import NeedleFoundation
import Core

protocol AuthNetworkDependency: Dependency {
    var networkService: NetworkServiceProtocol { get }
}

final class AuthNetworkComponent: Component<AuthNetworkDependency> {
    
    var authNetworkService: AuthNetworkProtocol {
        shared { AuthNetworkAssembly().assemble(networkService: dependency.networkService) }
    }
}
