//
//  NetworkError.swift
//  MyGuard
//
//  Created by Иван Спирин on 29.06.2025.
//

import Foundation

enum NetworkError: Error {
    case unknown
    case forbidden
    case notFound
    case badURL
}
