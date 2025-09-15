//
//  AuthNetworkDependency.swift
//  MyGuard
//
//  Created by Иван Спирин on 15.09.2025.
//

import Foundation
import NeedleFoundation

protocol AuthNetworkDependency: Dependency {
    var networkService: NetworkServiceProtocol { get }
}
