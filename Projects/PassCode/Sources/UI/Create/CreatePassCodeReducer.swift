//
//  CreatePassCodeReducer.swift
//  MyGuard
//
//  Created by Иван Спирин on 23.08.2025.
//

import Foundation
import UDFKit
import Core

struct CreatePassCodeReducer: Reducer, Sendable {
    
    struct State {
        var passCode: String = ""
        var confirmationPassCode: String = ""
        
        let filter = "0123456789"
    }
    
    enum Action {
        case changePassCode(WritableKeyPath<State, String>, String)
        case filterPassCode(WritableKeyPath<State, String>, String)
        case save
    }
    
    @ThreadSafe var dependency: CreatePassCodeDependency
    
    func reduce(_ state: inout State, action: Action) -> ReducerResult<Action, Never> {
        switch action {
            case let .changePassCode(keyPath, text):
                state[keyPath: keyPath] = text
            case let .filterPassCode(keyPath, text):
                let filtered = text.filter { state.filter.contains($0) }
                if filtered != text {
                    state[keyPath: keyPath] = filtered
                }
                state[keyPath: keyPath] = String(state[keyPath: keyPath].prefix(6))
            case .save:
                dependency.authorizationService.createPassCode(state.passCode)
        }
        
        return .init(effect: .none)
    }
}
