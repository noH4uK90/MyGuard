//
//  AppDependency.swift
//  App
//
//  Created by Иван Спирин on 12/27/25.
//

import NeedleFoundation
import Core

protocol AppDependency: Dependency {
    var authorizationService: AuthorizationServiceProtocol { get }
    var navigationService: NavigationServiceProtocol { get }
}

final class AppComponent: Component<AppDependency> {}
