

import Core
import NeedleFoundation
import SwiftUI
import UDFKit
import UIKit

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class RecoveryPasswordDependency537fe14395ddd5406de7Provider: RecoveryPasswordDependency {


    init() {

    }
}
/// ^->AuthCoordinatorComponent->RecoveryPasswordComponent
private func factory9a23ff2b1dec660aad19e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RecoveryPasswordDependency537fe14395ddd5406de7Provider()
}
private class AuthDependency22a7984f26a2a4fa8c62Provider: AuthDependency {
    var authorizationService: AuthorizationServiceProtocol {
        return authCoordinatorComponent.authorizationService
    }
    private let authCoordinatorComponent: AuthCoordinatorComponent
    init(authCoordinatorComponent: AuthCoordinatorComponent) {
        self.authCoordinatorComponent = authCoordinatorComponent
    }
}
/// ^->AuthCoordinatorComponent->AuthComponent
private func factory957e95baeeb69caa591844808886724a7fc47835(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AuthDependency22a7984f26a2a4fa8c62Provider(authCoordinatorComponent: parent1(component) as! AuthCoordinatorComponent)
}

#else
extension RecoveryPasswordComponent: NeedleFoundation.Registration {
    public func registerItems() {

    }
}
extension AuthComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\AuthDependency.authorizationService] = "authorizationService-AuthorizationServiceProtocol"
    }
}
extension AuthCoordinatorComponent: NeedleFoundation.Registration {
    public func registerItems() {

        localTable["authorizationService-AuthorizationServiceProtocol"] = { [unowned self] in self.authorizationService as Any }
    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->AuthCoordinatorComponent->RecoveryPasswordComponent", factory9a23ff2b1dec660aad19e3b0c44298fc1c149afb)
    registerProviderFactory("^->AuthCoordinatorComponent->AuthComponent", factory957e95baeeb69caa591844808886724a7fc47835)
    registerProviderFactory("^->AuthCoordinatorComponent", factoryEmptyDependencyProvider)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
