//
//  NetworkServiceComponent.swift
//  App
//
//  Created by Иван Спирин on 12/27/25.
//

import NeedleFoundation
import Core

final class NetworkServiceComponent: Component<EmptyDependency> {
    
    var networkService: NetworkServiceProtocol {
        shared { NetworkServiceAssembly().assemble() }
    }
}
