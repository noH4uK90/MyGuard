//
//  PasswordNetworkAssembly.swift
//  Core
//
//  Created by Иван Спирин on 12/27/25.
//

public final class PasswordNetworkAssembly {
    
    public init() {}
    
    public func assemble(networkService: NetworkServiceProtocol) -> PasswordNetworkProtocol {
        PasswordNetworkService(networkService: networkService)
    }
}
