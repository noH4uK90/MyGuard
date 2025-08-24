//
//  ReducerPasswordDetail.swift
//  MyGuard
//
//  Created by Иван Спирин on 19.08.2025.
//

import Foundation
import UDFKit

struct PasswordDetailReducer: Reducer, Sendable {
    
    enum UIState { case loading, detail, editing }
    
    struct State {
        var draft: PasswordDetail
        var canSave: Bool = true
        var uiState: UIState = .loading
        var isDeleted: Bool = false
        
        var isShowingCancelConfirmation: Bool = false
        var isShowingDeleteConfirmation: Bool = false
        
        init(draft: PasswordDetail) {
            self.draft = draft
        }
        
        private var backup: PasswordDetail?
        
        mutating func changeBackup(to detail: PasswordDetail) {
            self.backup = detail
        }
        
        var isEqual: Bool {
            draft == backup
        }
    }
    
    enum Action {
        case load
        case loaded(PasswordDetail)
        
        case editOnTap
        case saveOnTap
        case saved
        
        case changeText(WritableKeyPath<PasswordDetail, String>, String)
        
        case cancelOnTap
        case cancelConfirmationOnTap(Bool)
        
        case deleteOnTap
        case deleteConfirmationOnTap(Bool, @Sendable @autoclosure () -> Void)
        case deleteConfirmed
    }
    
    @ThreadSafe var dependency: PasswordDetailDependency
    
    func reduce(_ state: inout State, action: Action) -> Effect<Action> {
        switch action {
            case .load:
                state.uiState = .loading
                state.changeBackup(to: state.draft)
                let passwordId = state.draft.id
                return .run { send in
                    let detail = try await getPasswordDetail(with: passwordId)
                    await send(.loaded(detail))
                }
            case let .loaded(detail):
                state.draft = detail
                state.uiState = .detail
                
            case .editOnTap:
                state.uiState = .editing
                state.changeBackup(to: state.draft)
            case .saveOnTap:
                if state.isEqual {
                    state.uiState = .detail
                } else {
                    let password = state.draft
                    return .run { send in
                        try await updatePasswordDetail(password)
                        await send(.saved)
                    }
                }
            case .saved:
                state.changeBackup(to: state.draft)
                state.uiState = .detail
                
            case let .changeText(keyPath, value):
                state.draft[keyPath: keyPath] = value
                state.canSave =
                    !state.draft.name.isEmpty && state.draft.name.count <= 300
                    && !state.draft.login.isEmpty
                    && state.draft.login.count <= 300
                    && state.draft.password.count >= 8
                
            case .cancelOnTap:
                state.isShowingCancelConfirmation.toggle()
                if state.isEqual && state.isShowingCancelConfirmation {
                    state.uiState = .detail
                }
            case let .cancelConfirmationOnTap(isConfirmed):
                state.isShowingCancelConfirmation = false
                if isConfirmed {
                    state.uiState = .detail
                }

            case .deleteOnTap:
                state.isShowingDeleteConfirmation.toggle()
            case let .deleteConfirmationOnTap(isConfirmed, dismiss):
                if isConfirmed {
                    let passwordId = state.draft.id
                    return .run { send in
                        try await deletePasswordDetail(with: passwordId, dismiss())
                        await send(.deleteConfirmed)
                    }
                }
                state.isShowingDeleteConfirmation = false
            case .deleteConfirmed:
                state.isShowingDeleteConfirmation = false
                state.isDeleted = true
        }
        return .none
    }
    
    private func getPasswordDetail(with id: Int) async throws -> PasswordDetail {
        try await dependency.passwordNetworkService.getPasswordDetail(id: id)
    }
    
    private func deletePasswordDetail(with id: Int, _ dismiss: @Sendable @autoclosure @escaping () -> Void) async throws {
        await MainActor.run {
            dismiss()
        }
        try await dependency.passwordNetworkService.deletePassword(id: id)
    }
    
    private func updatePasswordDetail(_ passwordDetail: PasswordDetail) async throws {
        let passwordRequest = passwordDetail.toRequest()
        try await dependency.passwordNetworkService.updatePassword(password: passwordRequest)
    }
    
}
