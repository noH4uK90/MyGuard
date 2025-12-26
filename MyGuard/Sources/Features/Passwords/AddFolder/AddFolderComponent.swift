//
//  AddFolderComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 03.07.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit

final class AddFolderComponent: Component<AddFolderDependency> {
    
    func store(folderId: Int) -> Store<AddFolderReducer> {
        let safeDependency = ThreadSafe(dependency!)
        return Store(state: AddFolderReducer.State(id: folderId), reducer: AddFolderReducer(dependency: safeDependency))
    }
    
    func view(store: Store<AddFolderReducer>) -> some View {
        AddFolderView(store: store)
    }
}

protocol AddFolderBuilder {
    associatedtype ContentType: View
    
    @ViewBuilder func view(_ folderId: Int) -> ContentType
}
