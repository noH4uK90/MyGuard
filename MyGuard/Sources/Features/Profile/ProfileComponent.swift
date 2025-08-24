//
//  ProfileComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 26.06.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit

final class ProfileComponent: Component<ProfileDependency>, ViewsBuilder {
    
    var store: Store<ProfileReducer> {
        let safeDependency = ThreadSafe(dependency!)
        return Store(state: ProfileReducer.State(), reducer: ProfileReducer(dependency: safeDependency))
    }
    
    var view: some View {
        ProfileView(store: store)
    }
}
