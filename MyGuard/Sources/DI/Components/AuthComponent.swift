//
//  AuthComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 19.06.2025.
//

import NeedleFoundation

class AuthComponent: Component<AuthDependency> {
    
    var authViewModel: AuthViewModel {
        AuthViewModel()
    }
    
    var authView: AuthView {
        return AuthView()
    }
}
