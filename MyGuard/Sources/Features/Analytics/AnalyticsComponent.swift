//
//  AnalyticsComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 26.06.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit

final class AnalyticsComponent: Component<AnalyticsDependency>, ViewsBuilder {
    
    var store: Store<AnalyticsReducer> {
        let safeDependency = ThreadSafe(dependency!)
        return Store(state: AnalyticsReducer.State(), reducer: AnalyticsReducer(dependency: safeDependency))
    }
    
    var view: some View {
        AnalyticsView()
    }
    
}
