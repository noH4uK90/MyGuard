//
//  Folder.swift
//  MyGuard
//
//  Created by Иван Спирин on 29.06.2025.
//

import Foundation

struct Folder: Identifiable, Decodable, Sendable {
    var id: String
    var name: String
    var children: [Folder]?
}
