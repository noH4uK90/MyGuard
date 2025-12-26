//
//  PasswordDestinationCommand.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.12.2025.
//

import Foundation

enum PasswordDestinationCommand: Equatable {
    case detail(Int)
    case addPassword(Int)
    case addFolder(Int)
    case pop
}
