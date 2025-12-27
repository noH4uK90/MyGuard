//
//  AuthResponse.swift
//  MyGuard
//
//  Created by Иван Спирин on 15.09.2025.
//

import Foundation

public struct AuthResponse: Decodable {
    public let access: Bool
    public let user: User
}
