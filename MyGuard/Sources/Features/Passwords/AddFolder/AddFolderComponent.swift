//
//  AddFolderComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 03.07.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit

final class AddFolderComponent: Component<AddFolderDependency>, AddFolderBuilder {
    
    func store(folderId: Int) -> Store<AddFolderReducer> {
        let safeDependency = ThreadSafe(dependency!)
        return Store(state: AddFolderReducer.State(id: folderId), reducer: AddFolderReducer(dependency: safeDependency))
    }
    
    func view(_ folderId: Int) -> some View {
        AddFolderView(store: store(folderId: folderId))
    }
}

@MainActor
protocol AddFolderBuilder: Sendable {
    associatedtype ContentType: View
    
    @ViewBuilder func view(_ folderId: Int) -> ContentType
}
