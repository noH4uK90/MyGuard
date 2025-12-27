//
//  Folder.swift
//  MyGuard
//
//  Created by Иван Спирин on 29.06.2025.
//

import Foundation

public struct Folder: Identifiable, Decodable, Sendable {
    public var id: String
    public var name: String
    public var children: [Folder]?
}
