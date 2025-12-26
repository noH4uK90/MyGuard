//
//  ReducerAddPassword.swift
//  MyGuard
//
//  Created by Иван Спирин on 18.08.2025.
//

import Foundation
import UDFKit

enum AddPasswordAction: Equatable {
    case addPasswordRequest(PasswordDetail)
}

struct AddPasswordReducer: Reducer, Sendable {
    
    struct State {
        var draft: PasswordDetail = .mock
        var canSave: Bool = false
    }
    
    enum Action {
        case load
        case save
        case draftChange(keyPath: WritableKeyPath<PasswordDetail, String>, String)
    }
    
    @ThreadSafe var dependency: AddPasswordDependency
    
    func reduce(_ state: inout State, action: Action) -> ReducerResult<Action, AddPasswordAction> {
        switch action {
            case .load:
                break
            case .save:
                let draft = state.draft
                return .init(effect: .none, output: .addPasswordRequest(draft))
            case let .draftChange(keyPath, text):
                state.draft[keyPath: keyPath] = text
                state.canSave =
                    !state.draft.name.isEmpty && state.draft.name.count <= 300
                    && !state.draft.login.isEmpty
                    && state.draft.login.count <= 300
                    && state.draft.password.count >= 8
        }
        return .init(effect: .none)
    }
}
