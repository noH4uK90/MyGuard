//
//  PasswordNetworkService.swift
//  MyGuard
//
//  Created by Иван Спирин on 01.07.2025.
//

import Foundation

public protocol PasswordNetworkProtocol: Sendable {
    
    func getPasswordDetail(id: Int) async throws -> PasswordDetail
    func addPassword(password: PasswordRequest) async throws
    func updatePassword(password: PasswordRequest) async throws
    func deletePassword(id: Int) async throws
}

internal final class PasswordNetworkService: PasswordNetworkProtocol {
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getPasswordDetail(id: Int) async throws -> PasswordDetail {
        guard let url = PasswordEndpoints.getPasswordDetail(id: id).absoluteURL else {
            throw NetworkError.badURL
        }
        
        return try await networkService.execute(for: url, .GET, nil)
    }
    
    func addPassword(password: PasswordRequest) async throws {
        guard let url = PasswordEndpoints.addPassword(password: password).absoluteURL else {
            throw NetworkError.badURL
        }
        
        try await networkService.execute(for: url, .POST, nil)
    }
    
    func updatePassword(password: PasswordRequest) async throws {
        guard let url = PasswordEndpoints.updatePassword(password: password).absoluteURL else {
            throw NetworkError.badURL
        }
        
        try await networkService.execute(for: url, .PUT, nil)
    }
    
    func deletePassword(id: Int) async throws {
        guard let url = PasswordEndpoints.deletePassword(id: id).absoluteURL else {
            throw NetworkError.badURL
        }
        
        try await networkService.execute(for: url, .DELETE, nil)
    }
    
}
