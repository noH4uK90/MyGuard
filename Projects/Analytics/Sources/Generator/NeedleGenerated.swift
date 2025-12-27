

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

private class AnalyticsDependency575c019ac7d7e70724c8Provider: AnalyticsDependency {


    init() {

    }
}
/// ^->AnalyticsCoordinatorComponent->AnalyticsComponent
private func factory8a4e5a903242a528307de3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AnalyticsDependency575c019ac7d7e70724c8Provider()
}

#else
extension AnalyticsComponent: NeedleFoundation.Registration {
    public func registerItems() {

    }
}
extension AnalyticsCoordinatorComponent: NeedleFoundation.Registration {
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
    registerProviderFactory("^->AnalyticsCoordinatorComponent->AnalyticsComponent", factory8a4e5a903242a528307de3b0c44298fc1c149afb)
    registerProviderFactory("^->AnalyticsCoordinatorComponent", factoryEmptyDependencyProvider)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
