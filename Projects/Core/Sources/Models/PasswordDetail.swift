//
//  PasswordDetail.swift
//  MyGuard
//
//  Created by Иван Спирин on 01.07.2025.
//

import Foundation

public struct PasswordDetail: Identifiable, Decodable, Equatable {
    public var name: String
    public var url: String
    public var login: String
    public var password: String
    public var note: String
    public let id: Int
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

extension PasswordDetail {
    
    public static func emptyWithPasswordId(_ id: Int) -> Self {
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
    
    public static func emptyWithFolderId(_ id: Int) -> Self {
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
    
    public static let mock: Self =
        .init(
            name: "",
            url: "",
            login: "",
            password: "",
            note: "",
            id: 0,
            folderId: 0
        )
    
    public func toRequest() -> PasswordRequest {
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
