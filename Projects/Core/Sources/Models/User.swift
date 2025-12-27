//
//  User.swift
//  MyGuard
//
//  Created by Иван Спирин on 15.09.2025.
//


public struct User: Identifiable, Decodable {
    public let id: Int
    public let name: String
    public let surname: String
    public let patronymic: String
    public let roleId: Int
    
    public enum CodingKeys: String, CodingKey {
        case id = "userId"
        case name, surname, patronymic, roleId
    }
}
