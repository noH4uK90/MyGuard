//
//  ProfileComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 26.06.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit

final class ProfileComponent: Component<ProfileDependency> {
    
    var store: Store<ProfileReducer> {
        let safeDependency = ThreadSafe(dependency!)
        return Store(state: ProfileReducer.State(), reducer: ProfileReducer(dependency: safeDependency))
    }
    
    func view(store: Store<ProfileReducer>) -> some View {
        ProfileView(store: store)
    }
}
