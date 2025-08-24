//
//  AddFolderReducer.swift
//  MyGuard
//
//  Created by Иван Спирин on 21.08.2025.
//

import Foundation
import UDFKit

struct AddFolderReducer: Reducer, Sendable {
    
    struct State {
        let id: Int
        var name: String = ""
        var canSave: Bool = false
    }
    
    enum Action {
        case changeName(String)
        
        case save(@Sendable @autoclosure () -> Void)
    }
    
    @ThreadSafe var dependency: AddFolderDependency
    
    func reduce(_ state: inout State, action: Action) -> Effect<Action> {
        switch action {
            case let .changeName(name):
                state.name = name
                state.canSave = !name.isEmpty
                
            case let .save(dismiss):
                let id = state.id
                let name = state.name
                return .run { send in
                    try await addFolder(with: name, for: id, dismiss())
                }
        }
        return .none
    }
    
    func addFolder(with name: String, for id: Int, _ dismiss: @Sendable @autoclosure @escaping () -> Void) async throws {
        try await dependency.folderNetworkService.addFolder(folder: .init(name: name, parentId: "\(id)"))
        await MainActor.run {
            dismiss()
        }
    }
}
