//
//  RecoveryPasswordComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 21.06.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit
import Core

protocol RecoveryPasswordDependency: Dependency {
    
}

final class RecoveryPasswordComponent: Component<RecoveryPasswordDependency> {
    
    var store: Store<RecoveryPasswordReducer> {
        let safeDependency = ThreadSafe(dependency!)
        let reducer = RecoveryPasswordReducer(dependency: safeDependency)
        return Store(state: RecoveryPasswordReducer.State(), reducer: reducer)
    }
    
    var view: some View {
        RecoveryPasswordView()
    }
}
