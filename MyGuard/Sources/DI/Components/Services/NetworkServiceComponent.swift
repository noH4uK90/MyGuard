//
//  NetworkServiceComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 21.06.2025.
//

import NeedleFoundation

final class NetworkServiceComponent: Component<NetworkServiceDependency> {
    
    var networkService: NetworkServiceProtocol {
        shared { NetworkService(parent: self) }
    }
}
