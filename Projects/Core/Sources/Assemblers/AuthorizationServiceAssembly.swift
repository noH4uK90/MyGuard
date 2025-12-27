//
//  AuthorizationServiceAssembly.swift
//  Core
//
//  Created by Иван Спирин on 12/27/25.
//

import Foundation

public final class AuthorizationServiceAssembly {
    
    public init() {}
    
    public func assemble(authNetwork: AuthNetworkProtocol) -> AuthorizationServiceProtocol {
        AuthorizationService(authNetworkService: authNetwork)
    }
}
