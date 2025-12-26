//
//  PasswordListReducer.swift
//  MyGuard
//
//  Created by Иван Спирин on 17.08.2025.
//

import Foundation
import UDFKit
import NeedleFoundation

enum PasswordListAction: Equatable {
    case openDetail(Int)
    case openAddPasswordForm(Int)
    case openAddFolderForm(Int)
}

struct PasswordListReducer: Reducer, Sendable {
    
    struct State {
        var folders: [Folder] = []
    }
    
    enum Action {
        case load
        case loaded([Folder])
        case delete(Folder)
        case reload
        
        case deletePassword(Int)
        case addPassword(PasswordDetail)
        case addFolder(FolderRequest)
        
        case openDetail(Int)
        case openAddPasswordForm(Int)
        case openAddFolderForm(Int)
    }
    
    @ThreadSafe var dependency: PasswordListDependency
    
    func reduce(_ state: inout State, action: Action) -> ReducerResult<Action, PasswordListAction> {
        switch action {
            case .load:
                return .init(effect: .run { send in
                    let folders = try await getFolders()
                    await send(.loaded(folders))
                })
            case let .loaded(folders):
                state.folders = folders
            case let .delete(folder):
                return .init(effect: .run { send in
                    if folder.children == nil {
                        try await deletePassword(Int(folder.id)!)
                    } else {
                        try await deleteFolder(Int(folder.id)!)
                    }
                    await send(.reload)
                })
            case .reload:
                return .init(effect: .run { send in
                    let folders = try await getFolders()
                    await send(.loaded(folders))
                })
                
            case let .deletePassword(id):
                return .init(effect: .run { send in
                    try await deletePassword(id)
                    await send(.reload)
                })
            case let .addPassword(password):
                return .init(effect: .run { send in
                    try await addPassword(password)
                    await send(.reload)
                })
            case let .addFolder(folder):
                return .init(effect: .run { send in
                    try await addFolder(folder)
                    await send(.reload)
                })
                
            case let .openDetail(id):
                return .init(effect: .none, output: .openDetail(id))
                
            case let .openAddPasswordForm(id):
                return .init(effect: .none, output: .openAddPasswordForm(id))
                
            case let .openAddFolderForm(id):
                return .init(effect: .none, output: .openAddFolderForm(id))
        }
        return .init(effect: .none)
    }
    
    private func getFolders() async throws -> [Folder] {
        try await dependency.folderNetworkService.getFolders()
    }
    
    private func deleteFolder(_ id: Int) async throws {
        try await dependency.folderNetworkService.deleteFolder(id: id)
    }
    
    private func deletePassword(_ id: Int) async throws {
        try await dependency.passwordNetworkService.deletePassword(id: id)
    }
    
    private func addPassword(_ password: PasswordDetail) async throws {
        try await dependency.passwordNetworkService.addPassword(password: password.toRequest())
    }
    
    private func addFolder(_ folder: FolderRequest) async throws {
        try await dependency.folderNetworkService.addFolder(folder: folder)
    }

}
