//
//  AddFolderComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 03.07.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit
import Core

protocol AddFolderDependency: Dependency {
    var folderNetworkService: FolderNetworkProtocol { get }
}

final class AddFolderComponent: Component<AddFolderDependency> {
    
    func store(folderId: Int) -> Store<AddFolderReducer> {
        let safeDependency = ThreadSafe(dependency!)
        let reducer = AddFolderReducer(dependency: safeDependency)
        return Store(state: AddFolderReducer.State(id: folderId), reducer: reducer)
    }
    
    func view(store: Store<AddFolderReducer>) -> some View {
        AddFolderView(store: store)
    }
}
