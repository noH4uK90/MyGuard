//
//  ProfileReducer.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.08.2025.
//

import Foundation
import UDFKit

struct ProfileReducer: Reducer, Sendable {
    
    struct State {
        
    }
    
    enum Action {
        case logout
    }
    
    @ThreadSafe var dependency: ProfileDependency
    
    func reduce(_ state: inout State, action: Action) -> Effect<Action> {
        switch action {
            case .logout:
                dependency.authorizationService.logout()
        }
        
        return .none
    }
}
