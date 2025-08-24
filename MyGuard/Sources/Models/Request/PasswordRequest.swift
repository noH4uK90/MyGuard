//
//  PasswordRequest.swift
//  MyGuard
//
//  Created by Иван Спирин on 02.07.2025.
//

import Foundation

struct PasswordRequest: Identifiable, Codable {
    var name: String
    var login: String
    var password: String
    var url: String?
    var note: String?
    var id: Int
    var folderId: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "passName"
        case url = "passURL"
        case login = "passLogin"
        case password = "passPassword"
        case note = "passNote"
        case id = "passItemId"
        case folderId = "passFolderId"
    }
}
