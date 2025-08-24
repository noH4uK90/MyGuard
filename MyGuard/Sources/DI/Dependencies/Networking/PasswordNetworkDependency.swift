//
//  PasswordNetworkDependency.swift
//  MyGuard
//
//  Created by Иван Спирин on 01.07.2025.
//

import NeedleFoundation

protocol PasswordNetworkDependency: Dependency {
    var networkService: NetworkServiceProtocol { get }
}
