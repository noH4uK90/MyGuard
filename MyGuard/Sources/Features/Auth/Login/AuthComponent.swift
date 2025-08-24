//
//  AuthComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 19.06.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit

final class AuthComponent: Component<AuthDependency>, ViewsBuilder {
    
    var store: Store<AuthReducer> {
        let safeDependency = ThreadSafe(dependency!)
        return Store(state: AuthReducer.State(), reducer: AuthReducer(dependency: safeDependency))
    }
    
    var view: AuthView<RecoveryPasswordComponent> {
        return AuthView(store: store, recoveryPasswordBuilder: recoveryPasswordComponent)
    }
    
    var recoveryPasswordComponent: RecoveryPasswordComponent {
        RecoveryPasswordComponent(parent: self)
    }
}
