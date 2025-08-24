//
//  InputPassCodeComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 06.07.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit

final class InputPassCodeComponent: Component<InputPassCodeDependency>, ViewsBuilder {
    
    var store: Store<InputPassCodeReducer> {
        let safeDependency = ThreadSafe(dependency!)
        return Store(state: InputPassCodeReducer.State(), reducer: InputPassCodeReducer(dependency: safeDependency))
    }
    
    var view: some View {
        InputPassCodeView(store: store)
    }
}
