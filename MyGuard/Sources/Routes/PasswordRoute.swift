//
//  PasswordRoute.swift
//  MyGuard
//
//  Created by Иван Спирин on 21.12.2025.
//

import Foundation

enum PasswordRoute: Hashable {
    case detail(id: Int)
    case addPassword(id: Int)
    case addFolder(id: Int)
}
