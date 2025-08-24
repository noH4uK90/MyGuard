//
//  AddPasswordDependency.swift
//  MyGuard
//
//  Created by Иван Спирин on 03.07.2025.
//

import NeedleFoundation

protocol AddPasswordDependency: Dependency {
    var passwordNetworkService: PasswordNetworkProtocol { get }
}
