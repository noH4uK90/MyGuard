//
//  AddPasswordComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 03.07.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit

final class AddPasswordComponent: Component<AddPasswordDependency>, AddPasswordBuilder {
    
    func store(folderId: Int) -> StoreOf<AddPasswordReducer> {
        let safeDependency = ThreadSafe(dependency!)
        return Store(state: AddPasswordReducer.State(draft: .emptyWithFolderId(folderId)), reducer: AddPasswordReducer(dependency: safeDependency))
    }
    
    func view(_ folderId: Int) -> some View {
        AddPasswordView(store: store(folderId: folderId))
    }
}

@MainActor
protocol AddPasswordBuilder: Sendable {
    associatedtype ContentType: View
    
    @ViewBuilder func view(_ folderId: Int) -> ContentType
}
