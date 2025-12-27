//
//  FolderRequest.swift
//  MyGuard
//
//  Created by Иван Спирин on 03.07.2025.
//

public struct FolderRequest: Codable, Equatable {
    public let name: String
    public let parentId: String
    
    public init(name: String, parentId: String) {
        self.name = name
        self.parentId = parentId
    }
}
