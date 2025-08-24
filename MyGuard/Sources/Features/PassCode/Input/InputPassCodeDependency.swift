//
//  InputPassCodeDependency.swift
//  MyGuard
//
//  Created by Иван Спирин on 06.07.2025.
//

import NeedleFoundation

protocol InputPassCodeDependency: Dependency {
    var authorizationService: AuthorizationServiceProtocol { get }
}
