//
//  AuthorizationServiceDependency.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.06.2025.
//

import NeedleFoundation

protocol AuthorizationServiceDependency: Dependency {
    var authNetworkService: AuthNetworkProtocol { get }
}
