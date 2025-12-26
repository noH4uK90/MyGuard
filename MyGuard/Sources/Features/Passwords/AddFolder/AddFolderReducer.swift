//
//  AddFolderReducer.swift
//  MyGuard
//
//  Created by Иван Спирин on 21.08.2025.
//

import Foundation
import UDFKit

enum AddFolderAction: Equatable {
    case addFolderRequest(FolderRequest)
}

struct AddFolderReducer: Reducer, Sendable {
    
    struct State {
        let id: Int
        var name: String = ""
        var canSave: Bool = false
    }
    
    enum Action {
        case changeName(String)
        
        case save
    }
    
    @ThreadSafe var dependency: AddFolderDependency
    
    func reduce(_ state: inout State, action: Action) -> ReducerResult<Action, AddFolderAction> {
        switch action {
            case let .changeName(name):
                state.name = name
                state.canSave = !name.isEmpty
                
            case .save:
                let id = state.id
                let name = state.name
                return .init(effect: .none, output: .addFolderRequest(.init(name: name, parentId: "\(id)")))
        }
        return .init(effect: .none)
    }
}
