//
//  AuthResponse.swift
//  MyGuard
//
//  Created by Иван Спирин on 15.09.2025.
//

import Foundation

struct AuthResponse: Decodable {
    let access: Bool
    let user: User
}
