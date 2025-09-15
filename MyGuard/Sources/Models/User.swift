//
//  User.swift
//  MyGuard
//
//  Created by Иван Спирин on 15.09.2025.
//


struct User: Identifiable, Decodable {
    let id: Int
    let name: String
    let surname: String
    let patronymic: String
    let roleId: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "userId"
        case name, surname, patronymic, roleId
    }
}