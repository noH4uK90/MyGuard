//
//  FolderEndpoints.swift
//  MyGuard
//
//  Created by Иван Спирин on 29.06.2025.
//

import Foundation

enum FolderEndpoints {
    case getFolders
    case addFolder(folder: FolderRequest)
    case deleteFolder(id: Int)
    
    var path: String {
        switch self {
            case .getFolders:
                ""
            case .addFolder:
                ""
            case .deleteFolder:
                ""
        }
    }
    
    var absoluteURL: URL? {
        var urlComponents = API.getComponents(tag: APITag.folder, path: path)
        
        switch self {
            case .getFolders:
                urlComponents.queryItems = [
                    URLQueryItem(name: "token", value: AppConfig.shared.apiToken)
                ]
            case .addFolder(let folder):
                urlComponents.queryItems = [
                    URLQueryItem(name: "token", value: AppConfig.shared.apiToken),
                    URLQueryItem(name: "name", value: folder.name),
                    URLQueryItem(name: "parentId", value: "\(folder.parentId)")
                ]
            case .deleteFolder(let id):
                urlComponents.queryItems = [
                    URLQueryItem(name: "token", value: AppConfig.shared.apiToken),
                    URLQueryItem(name: "id", value: "\(id)")
                ]
        }
        
        return urlComponents.url
    }
}
