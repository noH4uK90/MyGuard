

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

private class ProfileDependency678849351ffd3785cd69Provider: ProfileDependency {
    var authorizationService: AuthorizationServiceProtocol {
        return profileCoordinatorComponent.authorizationService
    }
    private let profileCoordinatorComponent: ProfileCoordinatorComponent
    init(profileCoordinatorComponent: ProfileCoordinatorComponent) {
        self.profileCoordinatorComponent = profileCoordinatorComponent
    }
}
/// ^->ProfileCoordinatorComponent->ProfileComponent
private func factory2e1174fbf714afe9816bd94ef094f8b15b91d5ac(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ProfileDependency678849351ffd3785cd69Provider(profileCoordinatorComponent: parent1(component) as! ProfileCoordinatorComponent)
}

#else
extension ProfileComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\ProfileDependency.authorizationService] = "authorizationService-AuthorizationServiceProtocol"
    }
}
extension ProfileCoordinatorComponent: NeedleFoundation.Registration {
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
    registerProviderFactory("^->ProfileCoordinatorComponent->ProfileComponent", factory2e1174fbf714afe9816bd94ef094f8b15b91d5ac)
    registerProviderFactory("^->ProfileCoordinatorComponent", factoryEmptyDependencyProvider)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
