//
//  AuthReducer.swift
//  MyGuard
//
//  Created by Иван Спирин on 21.08.2025.
//

import Foundation
import UDFKit

struct AuthReducer: Reducer, Sendable {
    
    struct State {
        var email: String = ""
        var password: String = ""
    }
    
    enum Action {
        case textChange(WritableKeyPath<State, String>, String)
        
        case loginOnTap
    }
    
    @ThreadSafe var dependency: AuthDependency
    
    func reduce(_ state: inout State, action: Action) -> ReducerResult<Action, Never> {
        switch action {
            case let .textChange(keyPath, text):
                state[keyPath: keyPath] = text
                
            case .loginOnTap:
                let email = state.email
                let password = state.password
                
                return .init(effect: .run { send in
                    try await login(email: email, password: password)
                })
        }
        return .init(effect: .none)
    }
    
    func login(email: String, password: String) async throws {
        try await dependency.authorizationService.login(email, password)
    }
}
