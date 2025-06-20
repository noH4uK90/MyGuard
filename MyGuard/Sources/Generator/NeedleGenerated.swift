

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

private class AuthDependency72382e2b19321dcd0a99Provider: AuthDependency {


    init() {

    }
}
/// ^->RootComponent->AuthComponent
private func factoryfef8ce3e5d7a6687fadee3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AuthDependency72382e2b19321dcd0a99Provider()
}
private class NetworkServiceDependency697fdae778ffa841daa1Provider: NetworkServiceDependency {


    init() {

    }
}
/// ^->RootComponent->NetworkService
private func factory0e4f6e785115083b2c57e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NetworkServiceDependency697fdae778ffa841daa1Provider()
}

#else
extension RootComponent: NeedleFoundation.Registration {
    public func registerItems() {


    }
}
extension AuthComponent: NeedleFoundation.Registration {
    public func registerItems() {

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
    registerProviderFactory("^->RootComponent->AuthComponent", factoryfef8ce3e5d7a6687fadee3b0c44298fc1c149afb)
    registerProviderFactory("^->RootComponent->NetworkService", factory0e4f6e785115083b2c57e3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
