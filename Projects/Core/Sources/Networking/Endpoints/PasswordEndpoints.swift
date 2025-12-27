//
//  PasswordEndpoints.swift
//  MyGuard
//
//  Created by Иван Спирин on 29.06.2025.
//

import Foundation

enum PasswordEndpoints {
    case getPasswordDetail(id: Int)
    case addPassword(password: PasswordRequest)
    case updatePassword(password: PasswordRequest)
    case deletePassword(id: Int)
    
    var path: String {
        switch self {
            case .getPasswordDetail:
                ""
            case .addPassword:
                ""
            case .updatePassword:
                ""
            case .deletePassword:
                ""
        }
    }
    
    var absoluteURL: URL? {
        var urlComponents = API.getComponents(tag: APITag.password, path: path)
        
        switch self {
            case .getPasswordDetail(let id):
                urlComponents.queryItems = [
                    URLQueryItem(name: "token", value: AppConfig.shared.apiToken),
                    URLQueryItem(name: "id", value: "\(id)")
                ]
            case .addPassword(let password):
                urlComponents.queryItems = [
                    URLQueryItem(name: "token", value: AppConfig.shared.apiToken),
                    URLQueryItem(name: "name", value: password.name),
                    URLQueryItem(name: "passLogin", value: password.login),
                    URLQueryItem(name: "passPassword", value: password.password),
                    URLQueryItem(name: "passFolderId", value: "\(password.folderId)"),
                    URLQueryItem(name: "passURL", value: password.url),
                    URLQueryItem(name: "passNote", value: password.note)
                ]
            case .updatePassword(let password):
                urlComponents.queryItems = [
                    URLQueryItem(name: "token", value: AppConfig.shared.apiToken),
                    URLQueryItem(name: "id", value: "\(password.id)"),
                    URLQueryItem(name: "name", value: password.name),
                    URLQueryItem(name: "passLogin", value: password.login),
                    URLQueryItem(name: "passFolderId", value: "\(password.folderId)"),
                    URLQueryItem(name: "passPassword", value: password.password)
                ]
                if let url = password.url {
                    urlComponents.queryItems?.append(URLQueryItem(name: "passURL", value: url))
                }
                if let note = password.note {
                    urlComponents.queryItems?.append(URLQueryItem(name: "passNote", value: note))
                }
            case .deletePassword(let id):
                urlComponents.queryItems = [
                    URLQueryItem(name: "token", value: AppConfig.shared.apiToken),
                    URLQueryItem(name: "id", value: "\(id)")
                ]
        }
        
        return urlComponents.url
    }
}
