//
//  RecoveryPasswordComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 21.06.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit

final class RecoveryPasswordComponent: Component<RecoveryPasswordDependency>, ViewsBuilder {
    
    var store: Store<RecoveryPasswordReducer> {
        let safeReducer = ThreadSafe(dependency!)
        return Store(state: RecoveryPasswordReducer.State(), reducer: RecoveryPasswordReducer(dependency: safeReducer))
    }
    
    var view: some View {
        RecoveryPasswordView()
    }
}
