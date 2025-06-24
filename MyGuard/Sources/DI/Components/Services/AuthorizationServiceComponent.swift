//
//  AuthorizationServiceComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.06.2025.
//

import NeedleFoundation

final class AuthorizationServiceComponent: Component<AuthorizationServiceDependency> {
    
    var authorizationService: AuthorizationService {
        shared { AuthorizationService() }
    }
}
