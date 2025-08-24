//
//  PasswordListDependency.swift
//  MyGuard
//
//  Created by Иван Спирин on 26.06.2025.
//

import NeedleFoundation
import UDFKit

protocol PasswordListDependency: Dependency {
    var folderNetworkService: FolderNetworkProtocol { get }
    var passwordNetworkService: PasswordNetworkProtocol { get }
}
