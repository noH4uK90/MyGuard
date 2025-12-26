//
//  AddPasswordComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 03.07.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit

final class AddPasswordComponent: Component<AddPasswordDependency> {
    
    func store(folderId: Int) -> StoreOf<AddPasswordReducer> {
        let safeDependency = ThreadSafe(dependency!)
        return Store(state: AddPasswordReducer.State(draft: .emptyWithFolderId(folderId)), reducer: AddPasswordReducer(dependency: safeDependency))
    }
    
    func view(store: StoreOf<AddPasswordReducer>) -> some View {
        AddPasswordView(store: store)
    }
}

protocol AddPasswordBuilder {
    associatedtype ContentType: View
    
    @ViewBuilder func view(_ folderId: Int) -> ContentType
}
