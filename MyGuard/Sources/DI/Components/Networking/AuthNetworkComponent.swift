//
//  AuthNetworkComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 15.09.2025.
//

import Foundation
import NeedleFoundation

final class AuthNetworkComponent: Component<AuthNetworkDependency> {
    var authNetworkService: AuthNetworkProtocol {
        shared { AuthNetworkService(networkService: dependency.networkService) }
    }
}
