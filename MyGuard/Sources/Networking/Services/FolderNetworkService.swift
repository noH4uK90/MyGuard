//
//  FolderNetworkService.swift
//  MyGuard
//
//  Created by Иван Спирин on 29.06.2025.
//

import Foundation

protocol FolderNetworkProtocol: Sendable {
    func getFolders() async throws -> [Folder]
    func addFolder(folder: FolderRequest) async throws
    func deleteFolder(id: Int) async throws
}

final class FolderNetworkService: FolderNetworkProtocol {
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getFolders() async throws -> [Folder] {
        guard let url = FolderEndpoints.getFolders.absoluteURL else {
            throw NetworkError.badURL
        }
        
        return try await networkService.execute(for: url, .GET, nil)
    }
    
    func addFolder(folder: FolderRequest) async throws {
        guard let url = FolderEndpoints.addFolder(folder: folder).absoluteURL else {
            throw NetworkError.badURL
        }
        
        try await networkService.execute(for: url, .POST, nil)
    }
    
    func deleteFolder(id: Int) async throws {
        guard let url = FolderEndpoints.deleteFolder(id: id).absoluteURL else {
            throw NetworkError.badURL
        }
        
        try await networkService.execute(for: url, .DELETE, nil)
    }
}
