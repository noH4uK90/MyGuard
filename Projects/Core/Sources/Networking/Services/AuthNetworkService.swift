//
//  AuthNetworkService.swift
//  MyGuard
//
//  Created by Иван Спирин on 15.09.2025.
//

import Foundation

public protocol AuthNetworkProtocol {
    
    func authorize(login: String, password: String) async throws -> AuthResponse
}

internal final class AuthNetworkService: AuthNetworkProtocol {
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    public func authorize(login: String, password: String) async throws -> AuthResponse {
        guard let url = AuthEndpoints.auth(login: login, password: password).absoluteURL else {
            throw NetworkError.badURL
        }
        
        return try await networkService.execute(for: url, .GET, nil)
    }
}
