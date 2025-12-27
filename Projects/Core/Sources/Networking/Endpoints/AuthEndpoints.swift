//
//  AuthEndpoints.swift
//  MyGuard
//
//  Created by Иван Спирин on 15.09.2025.
//

import Foundation

enum AuthEndpoints {
    
    case auth(login: String, password: String)
    
    var path: String {
        switch self {
            case .auth:
                ""
        }
    }
    
    var absoluteURL: URL? {
        var urlComponents = API.getComponents(tag: .auth, path: self.path)
    
        switch self {
            case .auth(let login, let password):
                urlComponents.queryItems = [
                    URLQueryItem(name: "token", value: AppConfig.shared.apiToken),
                    URLQueryItem(name: "login", value: login),
                    URLQueryItem(name: "password", value: password)
                ]
        }
        
        return urlComponents.url
    }
}
