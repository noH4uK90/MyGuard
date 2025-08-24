//
//  CreatePassCodeDependency.swift
//  MyGuard
//
//  Created by Иван Спирин on 07.07.2025.
//

import NeedleFoundation

protocol CreatePassCodeDependency: Dependency {
    var authorizationService: AuthorizationServiceProtocol { get }
}
