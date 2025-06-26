//
//  AnalyticsComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 26.06.2025.
//

import NeedleFoundation
import SwiftUI

final class AnalyticsComponent: Component<AnalyticsDependency>, ViewsBuilder {
    
    var viewModel: AnalyticsViewModel {
        AnalyticsViewModel()
    }
    
    var view: some View {
        AnalyticsView()
    }
    
}

protocol AnalyticsBuilder {
    associatedtype ContentType: View
    
    var view: ContentType { get }
}
