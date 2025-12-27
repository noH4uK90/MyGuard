//
//  AnalyticsComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 26.06.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit
import Core

protocol AnalyticsDependency: Dependency {
    
}

final class AnalyticsComponent: Component<AnalyticsDependency> {
    
    var store: Store<AnalyticsReducer> {
        let safeDependency = ThreadSafe(dependency!)
        let reducer = AnalyticsReducer(dependency: safeDependency)
        return Store(state: AnalyticsReducer.State(), reducer: reducer)
    }
    
    func view(store: Store<AnalyticsReducer>) -> some View {
        AnalyticsView()
    }
    
}
