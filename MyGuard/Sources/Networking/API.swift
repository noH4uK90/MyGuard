//
//  API.swift
//  MyGuard
//
//  Created by Иван Спирин on 29.06.2025.
//

import Foundation

enum API {
    static func getComponents(
        scheme: URLScheme = .https,
        host: URLHost = .baseURL,
        tag: APITag,
        path: String
    ) -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme.rawValue
        urlComponents.host = host.rawValue
        urlComponents.path = "/api" + tag.rawValue + path
        return urlComponents
    }
}
