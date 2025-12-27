

import Auth
import Core
import NeedleFoundation
import PassCode
import TabBar
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

private class AppDependencyd3a0c0ebef1840f14881Provider: AppDependency {
    var authorizationService: AuthorizationServiceProtocol {
        return appCoordinatorComponent.authorizationService
    }
    var navigationService: NavigationServiceProtocol {
        return appCoordinatorComponent.navigationService
    }
    private let appCoordinatorComponent: AppCoordinatorComponent
    init(appCoordinatorComponent: AppCoordinatorComponent) {
        self.appCoordinatorComponent = appCoordinatorComponent
    }
}
/// ^->AppCoordinatorComponent->AppComponent
private func factory44127d1ce3770a2296f0c386e62f508005d1a9a4(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AppDependencyd3a0c0ebef1840f14881Provider(appCoordinatorComponent: parent1(component) as! AppCoordinatorComponent)
}
private class AuthNetworkDependency3d7c5c0debd9b4f3501cProvider: AuthNetworkDependency {
    var networkService: NetworkServiceProtocol {
        return appCoordinatorComponent.networkService
    }
    private let appCoordinatorComponent: AppCoordinatorComponent
    init(appCoordinatorComponent: AppCoordinatorComponent) {
        self.appCoordinatorComponent = appCoordinatorComponent
    }
}
/// ^->AppCoordinatorComponent->AuthNetworkComponent
private func factory704bd77dddaf223a0a2bc386e62f508005d1a9a4(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AuthNetworkDependency3d7c5c0debd9b4f3501cProvider(appCoordinatorComponent: parent1(component) as! AppCoordinatorComponent)
}
private class AuthorizationServiceDependencyf43638bbd0c307313470Provider: AuthorizationServiceDependency {
    var authNetworkService: AuthNetworkProtocol {
        return appCoordinatorComponent.authNetworkService
    }
    private let appCoordinatorComponent: AppCoordinatorComponent
    init(appCoordinatorComponent: AppCoordinatorComponent) {
        self.appCoordinatorComponent = appCoordinatorComponent
    }
}
/// ^->AppCoordinatorComponent->AuthorizationServiceComponent
private func factory35f81ac66616561eaab2c386e62f508005d1a9a4(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AuthorizationServiceDependencyf43638bbd0c307313470Provider(appCoordinatorComponent: parent1(component) as! AppCoordinatorComponent)
}
private class NavigationServiceDependencyff20e798a13c483b9fffProvider: NavigationServiceDependency {
    var authorizationState: AuthorizationStateProtocol {
        return appCoordinatorComponent.authorizationState
    }
    private let appCoordinatorComponent: AppCoordinatorComponent
    init(appCoordinatorComponent: AppCoordinatorComponent) {
        self.appCoordinatorComponent = appCoordinatorComponent
    }
}
/// ^->AppCoordinatorComponent->NavigationServiceComponent
private func factory466c7c085009a699f29fc386e62f508005d1a9a4(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NavigationServiceDependencyff20e798a13c483b9fffProvider(appCoordinatorComponent: parent1(component) as! AppCoordinatorComponent)
}

#else
extension AppComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\AppDependency.authorizationService] = "authorizationService-AuthorizationServiceProtocol"
        keyPathToName[\AppDependency.navigationService] = "navigationService-NavigationServiceProtocol"
    }
}
extension AppCoordinatorComponent: NeedleFoundation.Registration {
    public func registerItems() {


    }
}
extension AuthNetworkComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\AuthNetworkDependency.networkService] = "networkService-NetworkServiceProtocol"
    }
}
extension AuthorizationServiceComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\AuthorizationServiceDependency.authNetworkService] = "authNetworkService-AuthNetworkProtocol"
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
    registerProviderFactory("^->AppCoordinatorComponent->AppComponent", factory44127d1ce3770a2296f0c386e62f508005d1a9a4)
    registerProviderFactory("^->AppCoordinatorComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AppCoordinatorComponent->AuthNetworkComponent", factory704bd77dddaf223a0a2bc386e62f508005d1a9a4)
    registerProviderFactory("^->AppCoordinatorComponent->AuthorizationServiceComponent", factory35f81ac66616561eaab2c386e62f508005d1a9a4)
    registerProviderFactory("^->AppCoordinatorComponent->NetworkServiceComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AppCoordinatorComponent->NavigationServiceComponent", factory466c7c085009a699f29fc386e62f508005d1a9a4)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
