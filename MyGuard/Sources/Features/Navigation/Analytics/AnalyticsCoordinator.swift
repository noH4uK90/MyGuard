//
//  AnalyticsCoordinator.swift
//  MyGuard
//
//  Created by Иван Спирин on 12/26/25.
//

import UIKit
import SwiftUI

final class AnalyticsCoordinator: BaseCoordinator, Coordinator {
    
    let navigationController: UINavigationController
    
    private let analyticsComponent: AnalyticsComponent
    
    init(
        scope: Any,
        navigationController: UINavigationController,
        analyticsComponent: AnalyticsComponent
    ) {
        self.navigationController = navigationController
        self.analyticsComponent = analyticsComponent
        super.init(scope: scope)
    }
    
    func start() {
        makeAnalytics()
    }
    
    func handle(_ command: AnalyticsDestinationCommand) {
        
    }
}

extension AnalyticsCoordinator {
    
    func makeAnalytics() {
        let store = analyticsComponent.store
        let view = analyticsComponent.view(store: store)
        let vc = UIHostingController(rootView: view)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.title = String(localized: "analyticsTabTitle")
        navigationController.setViewControllers([vc], animated: true)
    }
}
