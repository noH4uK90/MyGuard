//
//  NavigationServiceComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.06.2025.
//

import NeedleFoundation

final class NavigationServiceComponent: Component<NavigationServiceDependency> {
    
    var navigationService: NavigationServiceProtocol {
        shared { NavigationService(authState: dependency.authorizationState) }
    }
}
