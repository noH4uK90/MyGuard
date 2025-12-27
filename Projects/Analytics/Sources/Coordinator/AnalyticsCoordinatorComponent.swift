//
//  AnalyticsCoordinatorComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 12/26/25.
//

import NeedleFoundation
import UIKit
import Core

public protocol AnalyticsCoordinatorDependency: Dependency {

}

public final class AnalyticsCoordinatorComponent: BootstrapComponent {
    
    public override init() {}
    
    lazy var navigationController: UINavigationController = {
        UINavigationController()
    }()

    public func assemble() -> Coordinator {
        AnalyticsCoordinator(
            scope: self,
            navigationController: navigationController,
            analyticsComponent: analyticsComponent
        )
    }
}

extension AnalyticsCoordinatorComponent {

    var analyticsComponent: AnalyticsComponent {
        AnalyticsComponent(parent: self)
    }
}
