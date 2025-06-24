//
//  AuthViewModel.swift
//  MyGuard
//
//  Created by Иван Спирин on 19.06.2025.
//

import Foundation

final class AuthViewModel: ObservableObject {
    
    let authorizationService: AuthorizationServiceProtocol
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    init(authorizationService: AuthorizationServiceProtocol) {
        self.authorizationService = authorizationService
    }
    
    func login() {
        authorizationService.login()
    }
}
