//
//  PasswordDetailComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 01.07.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit

final class PasswordDetailComponent: Component<PasswordDetailDependency> {
    
    func store(id: Int) -> StoreOf<PasswordDetailReducer> {
        let safeDependency = ThreadSafe(dependency!)
        return Store(state: PasswordDetailReducer.State(draft: .emptyWithPasswordId(id)), reducer: PasswordDetailReducer(dependency: safeDependency))
    }
    
    func view(store: StoreOf<PasswordDetailReducer>) -> some View {
        PasswordDetailView(store: store)
    }
}

protocol PasswordDetailBuilder {
    associatedtype ContentType: View
    
    @ViewBuilder func view(_ id: Int) -> ContentType
}
