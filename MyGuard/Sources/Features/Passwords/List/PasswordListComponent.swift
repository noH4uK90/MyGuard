//
//  PasswordListComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 26.06.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit

final class PasswordListComponent: Component<PasswordListDependency> {
    
    lazy var store: StoreOf<PasswordListReducer> = {
        let safeDependency = ThreadSafe(dependency!)
        return Store(state: PasswordListReducer.State(), reducer: PasswordListReducer(dependency: safeDependency))
    }()
    
    func view(store: StoreOf<PasswordListReducer>) -> some View {
        PasswordListView(store: store)
    }
}
