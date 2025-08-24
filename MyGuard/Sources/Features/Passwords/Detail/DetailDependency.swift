//
//  PasswordDetailDependency.swift
//  MyGuard
//
//  Created by Иван Спирин on 01.07.2025.
//

import NeedleFoundation

protocol PasswordDetailDependency: Dependency {
    var passwordNetworkService: PasswordNetworkProtocol { get }
}
