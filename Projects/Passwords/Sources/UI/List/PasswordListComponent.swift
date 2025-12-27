//
//  PasswordListComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 26.06.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit
import Core

protocol PasswordListDependency: Dependency {
    var folderNetworkService: FolderNetworkProtocol { get }
    var passwordNetworkService: PasswordNetworkProtocol { get }
}

final class PasswordListComponent: Component<PasswordListDependency> {
    
    lazy var store: StoreOf<PasswordListReducer> = {
        let safeDependency = ThreadSafe(dependency!)
        let reducer = PasswordListReducer(dependency: safeDependency)
        return Store(state: PasswordListReducer.State(), reducer: reducer)
    }()
    
    func view(store: StoreOf<PasswordListReducer>) -> some View {
        PasswordListView(store: store)
    }
}
