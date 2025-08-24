//
//  RecoveryPasswordReducer.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.08.2025.
//

import Foundation
import UDFKit

struct RecoveryPasswordReducer: Reducer, Sendable {
    
    struct State {
        
    }
    
    enum Action {
        
    }
    
    @ThreadSafe var dependency: RecoveryPasswordDependency
    
    func reduce(_ state: inout State, action: Action) -> Effect<Action> {
        switch action {
                
        }
        
        return .none
    }
}
