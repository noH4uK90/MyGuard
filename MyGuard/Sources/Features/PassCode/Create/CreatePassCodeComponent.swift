//
//  CreatePassCodeComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 07.07.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit

final class CreatePassCodeComponent: Component<CreatePassCodeDependency>, ViewsBuilder {
    
    var store: Store<CreatePassCodeReducer> {
        let safeDependency = ThreadSafe(dependency!)
        return Store(state: CreatePassCodeReducer.State(), reducer: CreatePassCodeReducer(dependency: safeDependency))
    }
    
    var view: some View {
        CreatePassCodeView(store: store)
    }
}
