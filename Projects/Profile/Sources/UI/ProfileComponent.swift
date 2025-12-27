//
//  ProfileComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 26.06.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit
import Core

protocol ProfileDependency: Dependency {
    var authorizationService: AuthorizationServiceProtocol { get }
}

final class ProfileComponent: Component<ProfileDependency> {
    
    var store: Store<ProfileReducer> {
        let safeDependency = ThreadSafe(dependency!)
        let reducer = ProfileReducer(dependency: safeDependency)
        return Store(state: ProfileReducer.State(), reducer: reducer)
    }
    
    func view(store: Store<ProfileReducer>) -> some View {
        ProfileView(store: store)
    }
}
