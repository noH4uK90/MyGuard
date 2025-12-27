//
//  NetworkServiceAssembly.swift
//  Core
//
//  Created by Иван Спирин on 12/27/25.
//

import Foundation

public final class NetworkServiceAssembly {
    
    public init() {}
    
    public func assemble() -> NetworkServiceProtocol {
        NetworkService()
    }
}
