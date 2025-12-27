//
//  PasswordDetailComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 01.07.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit
import Core

protocol PasswordDetailDependency: Dependency {
    var passwordNetworkService: PasswordNetworkProtocol { get }
}

final class PasswordDetailComponent: Component<PasswordDetailDependency> {
    
    func store(id: Int) -> StoreOf<PasswordDetailReducer> {
        let safeDependency = ThreadSafe(dependency!)
        let reducer = PasswordDetailReducer(dependency: safeDependency)
        return Store(state: PasswordDetailReducer.State(draft: .emptyWithPasswordId(id)), reducer: reducer)
    }
    
    func view(store: StoreOf<PasswordDetailReducer>) -> some View {
        PasswordDetailView(store: store)
    }
}
