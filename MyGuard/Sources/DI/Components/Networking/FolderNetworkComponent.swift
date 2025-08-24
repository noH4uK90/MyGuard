//
//  FolderNetworkComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 29.06.2025.
//

import NeedleFoundation

final class FolderNetworkComponent: Component<FolderNetworkDependency> {
    
    var folderNetworkService: FolderNetworkProtocol {
        shared { FolderNetworkService(networkService: dependency.networkService) }
    }
}
