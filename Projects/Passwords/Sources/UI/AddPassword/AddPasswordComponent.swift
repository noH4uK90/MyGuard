//
//  AddPasswordComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 03.07.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit
import Core

protocol AddPasswordDependency: Dependency {
    var passwordNetworkService: PasswordNetworkProtocol { get }
}

final class AddPasswordComponent: Component<AddPasswordDependency> {
    
    func store(folderId: Int) -> StoreOf<AddPasswordReducer> {
        let safeDependency = ThreadSafe(dependency!)
        let reducer = AddPasswordReducer(dependency: safeDependency)
        return Store(state: AddPasswordReducer.State(draft: .emptyWithFolderId(folderId)), reducer: reducer)
    }
    
    func view(store: StoreOf<AddPasswordReducer>) -> some View {
        AddPasswordView(store: store)
    }
}
