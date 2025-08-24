//
//  PasswordNetworkComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 01.07.2025.
//

import NeedleFoundation

final class PasswordNetworkComponent: Component<PasswordNetworkDependency> {
    var passwordNetworkService: PasswordNetworkProtocol {
        shared { PasswordNetworkService(networkService: dependency.networkService) }
    }
}
