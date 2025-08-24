//
//  PasswordDetail.swift
//  MyGuard
//
//  Created by Иван Спирин on 01.07.2025.
//

import Foundation

struct PasswordDetail: Identifiable, Decodable, Equatable {
    var name: String
    var url: String
    var login: String
    var password: String
    var note: String
    let id: Int
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

extension PasswordDetail {
    
    static func emptyWithPasswordId(_ id: Int) -> Self {
        .init(
            name: "",
            url: "",
            login: "",
            password: "",
            note: "",
            id: id,
            folderId: 0
        )
    }
    
    static func emptyWithFolderId(_ id: Int) -> Self {
        .init(
            name: "",
            url: "",
            login: "",
            password: "",
            note: "",
            id: 0,
            folderId: id
        )
    }
    
    static let mock: Self = 
        .init(
            name: "",
            url: "",
            login: "",
            password: "",
            note: "",
            id: 0,
            folderId: 0
        )
    
    func toRequest() -> PasswordRequest {
        .init(
            name: self.name,
            login: self.login,
            password: self.password,
            url: self.url.isEmpty ? nil : self.url,
            note: self.note.isEmpty ? nil : self.note,
            id: self.id,
            folderId: self.folderId
        )
    }
}
