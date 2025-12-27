//
//  PasswordRequest.swift
//  MyGuard
//
//  Created by Иван Спирин on 02.07.2025.
//

import Foundation

public struct PasswordRequest: Identifiable, Codable {
    public var name: String
    public var login: String
    public var password: String
    public var url: String?
    public var note: String?
    public var id: Int
    public var folderId: Int
    
    public enum CodingKeys: String, CodingKey {
        case name = "passName"
        case url = "passURL"
        case login = "passLogin"
        case password = "passPassword"
        case note = "passNote"
        case id = "passItemId"
        case folderId = "passFolderId"
    }
}
