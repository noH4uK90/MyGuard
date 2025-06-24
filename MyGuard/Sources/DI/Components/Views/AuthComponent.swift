//
//  AuthComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 19.06.2025.
//

import NeedleFoundation
import SwiftUI

final class AuthComponent: Component<AuthDependency>, AuthBuilder {
    
    var authViewModel: AuthViewModel {
        AuthViewModel(authorizationService: dependency.authorizationService)
    }
    
    var authView: AuthView<RecoveryPasswordComponent> {
        return AuthView(viewModel: authViewModel, recoveryPasswordBuilder: recoveryPasswordComponent)
    }
    
    var recoveryPasswordComponent: RecoveryPasswordComponent {
        RecoveryPasswordComponent(parent: self)
    }
}

protocol AuthBuilder {
    associatedtype ContentView: View
    
    var authView: ContentView { get }
}
