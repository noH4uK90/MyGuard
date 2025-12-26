//
//  AnalyticsReducer.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.08.2025.
//

import Foundation
import UDFKit

struct AnalyticsReducer: Reducer, Sendable {
    
    struct State {
        
    }
    
    enum Action {
        
    }
    
    @ThreadSafe var dependency: AnalyticsDependency
    
    func reduce(_ state: inout State, action: Action) -> ReducerResult<Action, Never> {
        switch action {
                
        }
        
        return .init(effect: .none)
    }
    
}
