//
//  RootComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 19.06.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit

protocol RootDependency: Dependency {
    var authorizationService: AuthorizationServiceProtocol { get }
    var navigationService: NavigationServiceProtocol { get }
}

final class RootComponent: Component<RootDependency> {
    
}
