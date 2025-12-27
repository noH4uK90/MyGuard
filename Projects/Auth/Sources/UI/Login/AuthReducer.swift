//
//  AuthReducer.swift
//  MyGuard
//
//  Created by Иван Спирин on 21.08.2025.
//

import Foundation
import UDFKit
import Core

enum AuthAction: Equatable {
    case openRecoveryPassword
}

struct AuthReducer: Reducer, Sendable {
    
    struct State {
        var email: String = ""
        var password: String = ""
    }
    
    enum Action {
        case textChange(WritableKeyPath<State, String>, String)
        
        case loginOnTap
        
        case openRecoveryPassword
    }
    
    @ThreadSafe var dependency: AuthDependency
    
    func reduce(_ state: inout State, action: Action) -> ReducerResult<Action, AuthAction> {
        switch action {
            case let .textChange(keyPath, text):
                state[keyPath: keyPath] = text
                
            case .loginOnTap:
                let email = state.email
                let password = state.password
                
                return .init(effect: .run { send in
                    try await login(email: email, password: password)
                })
                
            case .openRecoveryPassword:
                return .init(effect: .none, output: .openRecoveryPassword)
        }
        return .init(effect: .none)
    }
    
    func login(email: String, password: String) async throws {
        try await dependency.authorizationService.login(email, password)
    }
}
