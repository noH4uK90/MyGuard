//
//  FolderNetworkDependency.swift
//  MyGuard
//
//  Created by Иван Спирин on 29.06.2025.
//

import NeedleFoundation

protocol FolderNetworkDependency: Dependency {
    var networkService: NetworkServiceProtocol { get }
}
