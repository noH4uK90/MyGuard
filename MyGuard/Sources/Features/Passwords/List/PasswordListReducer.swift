//
//  PasswordListReducer.swift
//  MyGuard
//
//  Created by Иван Спирин on 17.08.2025.
//

import Foundation
import UDFKit
import NeedleFoundation

struct PasswordListReducer: Reducer, Sendable {
    
    struct State {
        var folders: [Folder] = []
    }
    
    enum Action {
        case load
        case loaded([Folder])
        case delete(Folder)
    }
    
    @ThreadSafe var dependency: PasswordListDependency
    
    func reduce(_ state: inout State, action: Action) -> Effect<Action> {
        switch action {
            case .load:
                return .run { send in
                    let folders = try await getFolders()
                    await send(.loaded(folders))
                }
            case let .loaded(folders):
                state.folders = folders
            case let .delete(folder):
                return .run { send in
                    if folder.children == nil {
                        try await deletePassword(Int(folder.id)!)
                    } else {
                        try await deleteFolder(Int(folder.id)!)
                    }
                    let folders = try await getFolders()
                    await send(.loaded(folders))
                }
        }
        return .none
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

}
