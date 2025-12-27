//
//  NavigationServiceAssembly.swift
//  Core
//
//  Created by Иван Спирин on 12/27/25.
//

import Foundation

public final class NavigationServiceAssembly {
    
    public init() {}
    
    public func assemble(authState: AuthorizationStateProtocol) -> NavigationServiceProtocol {
        NavigationService(authState: authState)
    }
}
