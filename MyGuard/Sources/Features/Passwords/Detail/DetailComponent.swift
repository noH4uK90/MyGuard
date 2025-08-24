//
//  PasswordDetailComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 01.07.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit

@MainActor
final class PasswordDetailComponent: Component<PasswordDetailDependency>, PasswordDetailBuilder {
    
    func store(id: Int) -> StoreOf<PasswordDetailReducer> {
        let safeDependency = ThreadSafe(dependency!)
        return Store(state: PasswordDetailReducer.State(draft: .emptyWithPasswordId(id)), reducer: PasswordDetailReducer(dependency: safeDependency))
    }
    
    func view(_ id: Int) -> some View {
        PasswordDetailView(store: store(id: id))
    }
}

@MainActor
protocol PasswordDetailBuilder: Sendable {
    associatedtype ContentType: View
    
    @ViewBuilder func view(_ id: Int) -> ContentType
}
