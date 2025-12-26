//
//  AnalyticsCoordinatorComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 12/26/25.
//

import NeedleFoundation
import UIKit

protocol AnalyticsCoordinatorDependency: Dependency {

}

final class AnalyticsCoordinatorComponent: Component<AnalyticsCoordinatorDependency> {

    lazy var navigationController: UINavigationController = {
        UINavigationController()
    }()

    func assemble() -> Coordinator {
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
