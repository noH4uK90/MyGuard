//
//  FolderNetworkAssembly.swift
//  Core
//
//  Created by Иван Спирин on 12/27/25.
//

import Foundation

public final class FolderNetworkAssembly {
    
    public init() {}
    
    public func assemble(networkService: NetworkServiceProtocol) -> FolderNetworkProtocol {
        FolderNetworkService(networkService: networkService)
    }
}
