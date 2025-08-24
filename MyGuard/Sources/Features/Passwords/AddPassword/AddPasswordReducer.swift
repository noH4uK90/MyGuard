//
//  ReducerAddPassword.swift
//  MyGuard
//
//  Created by Иван Спирин on 18.08.2025.
//

import Foundation
import UDFKit

struct AddPasswordReducer: Reducer, Sendable {
    
    struct State {
        var draft: PasswordDetail = .mock
        var canSave: Bool = false
    }
    
    enum Action {
        case load
        case save(_ dismiss: @Sendable @autoclosure () -> Void)
        case draftChange(keyPath: WritableKeyPath<PasswordDetail, String>, String)
    }
    
    @ThreadSafe var dependency: AddPasswordDependency
    
    func reduce(_ state: inout State, action: Action) -> Effect<Action> {
        switch action {
            case .load:
                break
            case let .save(dismiss):
                let draft = state.draft
                return .run { send in
                    try await save(password: draft, dismiss())
                }
            case let .draftChange(keyPath, text):
                state.draft[keyPath: keyPath] = text
                state.canSave =
                    !state.draft.name.isEmpty && state.draft.name.count <= 300
                    && !state.draft.login.isEmpty
                    && state.draft.login.count <= 300
                    && state.draft.password.count >= 8
        }
        return .none
    }
    
    private func save(password: PasswordDetail, _ dismiss: @Sendable @autoclosure @escaping () -> Void) async throws {
        let passwordRequest = password.toRequest()
        try await dependency.passwordNetworkService.addPassword(password: passwordRequest)
        await MainActor.run {
            dismiss()
        }
    }
}
