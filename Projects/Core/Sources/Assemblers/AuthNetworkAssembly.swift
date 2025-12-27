//
//  AuthNetworkAssembly.swift
//  Core
//
//  Created by Иван Спирин on 12/27/25.
//

import Foundation

public final class AuthNetworkAssembly {
    
    public init() {}
    
    public func assemble(networkService: NetworkServiceProtocol) -> AuthNetworkProtocol {
        AuthNetworkService(networkService: networkService)
    }
}
