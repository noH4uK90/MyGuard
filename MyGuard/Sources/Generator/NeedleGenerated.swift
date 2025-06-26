

import Foundation
import NeedleFoundation
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class ProfileDependency6818e92e498fe07e2622Provider: ProfileDependency {


    init() {

    }
}
/// ^->RootComponent->ProfileComponent
private func factory62ee3a75b16d091e8f01e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ProfileDependency6818e92e498fe07e2622Provider()
}
private class AnalyticsDependency8323670433b9d6f5982eProvider: AnalyticsDependency {


    init() {

    }
}
/// ^->RootComponent->AnalyticsComponent
private func factoryf526b52b541977f192efe3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AnalyticsDependency8323670433b9d6f5982eProvider()
}
private class RecoveryPasswordDependency5c3868a8b470ed39559cProvider: RecoveryPasswordDependency {


    init() {

    }
}
/// ^->RootComponent->AuthComponent->RecoveryPasswordComponent
private func factoryf97002da1394e2ecc1cee3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RecoveryPasswordDependency5c3868a8b470ed39559cProvider()
}
private class PasswordListDependencyee1d1413debe2e0252b4Provider: PasswordListDependency {


    init() {

    }
}
/// ^->RootComponent->PasswordListComponent
private func factorycb949510ddf8531ca17fe3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return PasswordListDependencyee1d1413debe2e0252b4Provider()
}
private class AuthDependency72382e2b19321dcd0a99Provider: AuthDependency {
    var authorizationService: AuthorizationServiceProtocol {
        return rootComponent.authorizationService
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->AuthComponent
private func factoryfef8ce3e5d7a6687fadeb3a8f24c1d289f2c0f2e(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AuthDependency72382e2b19321dcd0a99Provider(rootComponent: parent1(component) as! RootComponent)
}
private class AuthorizationServiceDependency7cabb9f03075fe481372Provider: AuthorizationServiceDependency {


    init() {

    }
}
/// ^->RootComponent->AuthorizationServiceComponent
private func factorya33cbca5714df39a73d6e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AuthorizationServiceDependency7cabb9f03075fe481372Provider()
}
private class NetworkServiceDependency029df3653966923d4a2bProvider: NetworkServiceDependency {


    init() {

    }
}
/// ^->RootComponent->NetworkServiceComponent
private func factory135f53c453d8e7c03d43e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NetworkServiceDependency029df3653966923d4a2bProvider()
}
private class NavigationServiceDependencycb91f8e41c08e70d616dProvider: NavigationServiceDependency {
    var authorizationState: AuthorizationStateProtocol {
        return rootComponent.authorizationState
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->NavigationServiceComponent
private func factorye0c8ac25639f48c884dab3a8f24c1d289f2c0f2e(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NavigationServiceDependencycb91f8e41c08e70d616dProvider(rootComponent: parent1(component) as! RootComponent)
}
private class NetworkServiceDependencyd56facc1b0367d1943deProvider: NetworkServiceDependency {


    init() {

    }
}
/// ^->RootComponent->NetworkServiceComponent->NetworkService
private func factoryf992c75d0019970daabce3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NetworkServiceDependencyd56facc1b0367d1943deProvider()
}

#else
extension RootComponent: NeedleFoundation.Registration {
    public func registerItems() {


    }
}
extension ProfileComponent: NeedleFoundation.Registration {
    public func registerItems() {

    }
}
extension AnalyticsComponent: NeedleFoundation.Registration {
    public func registerItems() {

    }
}
extension RecoveryPasswordComponent: NeedleFoundation.Registration {
    public func registerItems() {

    }
}
extension PasswordListComponent: NeedleFoundation.Registration {
    public func registerItems() {

    }
}
extension AuthComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\AuthDependency.authorizationService] = "authorizationService-AuthorizationServiceProtocol"

    }
}
extension AuthorizationServiceComponent: NeedleFoundation.Registration {
    public func registerItems() {

    }
}
extension NetworkServiceComponent: NeedleFoundation.Registration {
    public func registerItems() {


    }
}
extension NavigationServiceComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\NavigationServiceDependency.authorizationState] = "authorizationState-AuthorizationStateProtocol"
    }
}
extension NetworkService: NeedleFoundation.Registration {
    public func registerItems() {

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
    registerProviderFactory("^->RootComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->RootComponent->ProfileComponent", factory62ee3a75b16d091e8f01e3b0c44298fc1c149afb)
    registerProviderFactory("^->RootComponent->AnalyticsComponent", factoryf526b52b541977f192efe3b0c44298fc1c149afb)
    registerProviderFactory("^->RootComponent->AuthComponent->RecoveryPasswordComponent", factoryf97002da1394e2ecc1cee3b0c44298fc1c149afb)
    registerProviderFactory("^->RootComponent->PasswordListComponent", factorycb949510ddf8531ca17fe3b0c44298fc1c149afb)
    registerProviderFactory("^->RootComponent->AuthComponent", factoryfef8ce3e5d7a6687fadeb3a8f24c1d289f2c0f2e)
    registerProviderFactory("^->RootComponent->AuthorizationServiceComponent", factorya33cbca5714df39a73d6e3b0c44298fc1c149afb)
    registerProviderFactory("^->RootComponent->NetworkServiceComponent", factory135f53c453d8e7c03d43e3b0c44298fc1c149afb)
    registerProviderFactory("^->RootComponent->NavigationServiceComponent", factorye0c8ac25639f48c884dab3a8f24c1d289f2c0f2e)
    registerProviderFactory("^->RootComponent->NetworkServiceComponent->NetworkService", factoryf992c75d0019970daabce3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
