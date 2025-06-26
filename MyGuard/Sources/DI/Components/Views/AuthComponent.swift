//
//  AuthComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 19.06.2025.
//

import NeedleFoundation
import SwiftUI

final class AuthComponent: Component<AuthDependency>, ViewsBuilder {
    
    
    var viewModel: AuthViewModel {
        AuthViewModel(authorizationService: dependency.authorizationService)
    }
    
    var view: AuthView<RecoveryPasswordComponent> {
        return AuthView(viewModel: viewModel, recoveryPasswordBuilder: recoveryPasswordComponent)
    }
    
    var recoveryPasswordComponent: RecoveryPasswordComponent {
        RecoveryPasswordComponent(parent: self)
    }
}

protocol AuthBuilder {
    associatedtype ContentView: View
    
    var view: ContentView { get }
}
