

import Foundation
import NeedleFoundation
import SwiftUI
import UDFKit

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

private func parent2(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class FolderNetworkDependencydcfba5bb04fba35f6290Provider: FolderNetworkDependency {
    var networkService: NetworkServiceProtocol {
        return rootComponent.networkService
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->FolderNetworkComponent
private func factory9eb2d8c7977e8d710c25b3a8f24c1d289f2c0f2e(_ component: NeedleFoundation.Scope) -> AnyObject {
    return FolderNetworkDependencydcfba5bb04fba35f6290Provider(rootComponent: parent1(component) as! RootComponent)
}
private class PasswordNetworkDependencyaf4a1349c36b1e778d69Provider: PasswordNetworkDependency {
    var networkService: NetworkServiceProtocol {
        return rootComponent.networkService
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->PasswordNetworkComponent
private func factory75006564c7d7c8e05e5cb3a8f24c1d289f2c0f2e(_ component: NeedleFoundation.Scope) -> AnyObject {
    return PasswordNetworkDependencyaf4a1349c36b1e778d69Provider(rootComponent: parent1(component) as! RootComponent)
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
private class RecoveryPasswordDependency5c3868a8b470ed39559cProvider: RecoveryPasswordDependency {


    init() {

    }
}
/// ^->RootComponent->AuthComponent->RecoveryPasswordComponent
private func factoryf97002da1394e2ecc1cee3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RecoveryPasswordDependency5c3868a8b470ed39559cProvider()
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
private class AddFolderDependencyd18b66ff89efa5a51fe1Provider: AddFolderDependency {
    var folderNetworkService: FolderNetworkProtocol {
        return rootComponent.folderNetworkService
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->PasswordListComponent->AddFolderComponent
private func factory069e68669e8bba48e413a9403e3301bb54f80df0(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AddFolderDependencyd18b66ff89efa5a51fe1Provider(rootComponent: parent2(component) as! RootComponent)
}
private class PasswordDetailDependency1bf52fe6a331b5244d78Provider: PasswordDetailDependency {
    var passwordNetworkService: PasswordNetworkProtocol {
        return rootComponent.passwordNetworkService
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->PasswordListComponent->PasswordDetailComponent
private func factorycd67a93efddee2c96a09a9403e3301bb54f80df0(_ component: NeedleFoundation.Scope) -> AnyObject {
    return PasswordDetailDependency1bf52fe6a331b5244d78Provider(rootComponent: parent2(component) as! RootComponent)
}
private class AddPasswordDependency752d84851d8be185c5a5Provider: AddPasswordDependency {
    var passwordNetworkService: PasswordNetworkProtocol {
        return rootComponent.passwordNetworkService
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->PasswordListComponent->AddPasswordComponent
private func factorya87b0bd176589d7e0b68a9403e3301bb54f80df0(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AddPasswordDependency752d84851d8be185c5a5Provider(rootComponent: parent2(component) as! RootComponent)
}
private class PasswordListDependencyee1d1413debe2e0252b4Provider: PasswordListDependency {
    var folderNetworkService: FolderNetworkProtocol {
        return rootComponent.folderNetworkService
    }
    var passwordNetworkService: PasswordNetworkProtocol {
        return rootComponent.passwordNetworkService
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->PasswordListComponent
private func factorycb949510ddf8531ca17fb3a8f24c1d289f2c0f2e(_ component: NeedleFoundation.Scope) -> AnyObject {
    return PasswordListDependencyee1d1413debe2e0252b4Provider(rootComponent: parent1(component) as! RootComponent)
}
private class ProfileDependency6818e92e498fe07e2622Provider: ProfileDependency {
    var authorizationService: AuthorizationServiceProtocol {
        return rootComponent.authorizationService
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->ProfileComponent
private func factory62ee3a75b16d091e8f01b3a8f24c1d289f2c0f2e(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ProfileDependency6818e92e498fe07e2622Provider(rootComponent: parent1(component) as! RootComponent)
}
private class InputPassCodeDependency442cfba4bb98b874f2dbProvider: InputPassCodeDependency {
    var authorizationService: AuthorizationServiceProtocol {
        return rootComponent.authorizationService
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->InputPassCodeComponent
private func factory36b6508c225fdf3e6d18b3a8f24c1d289f2c0f2e(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InputPassCodeDependency442cfba4bb98b874f2dbProvider(rootComponent: parent1(component) as! RootComponent)
}
private class CreatePassCodeDependency5c939347cc1679b8422bProvider: CreatePassCodeDependency {
    var authorizationService: AuthorizationServiceProtocol {
        return rootComponent.authorizationService
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->CreatePassCodeComponent
private func factoryb865d3d0442ff6a591b0b3a8f24c1d289f2c0f2e(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CreatePassCodeDependency5c939347cc1679b8422bProvider(rootComponent: parent1(component) as! RootComponent)
}
private class AnalyticsDependency8323670433b9d6f5982eProvider: AnalyticsDependency {


    init() {

    }
}
/// ^->RootComponent->AnalyticsComponent
private func factoryf526b52b541977f192efe3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AnalyticsDependency8323670433b9d6f5982eProvider()
}

#else
extension FolderNetworkComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\FolderNetworkDependency.networkService] = "networkService-NetworkServiceProtocol"
    }
}
extension PasswordNetworkComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\PasswordNetworkDependency.networkService] = "networkService-NetworkServiceProtocol"
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
extension RecoveryPasswordComponent: NeedleFoundation.Registration {
    public func registerItems() {

    }
}
extension AuthComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\AuthDependency.authorizationService] = "authorizationService-AuthorizationServiceProtocol"

    }
}
extension AddFolderComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\AddFolderDependency.folderNetworkService] = "folderNetworkService-FolderNetworkProtocol"
    }
}
extension PasswordDetailComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\PasswordDetailDependency.passwordNetworkService] = "passwordNetworkService-PasswordNetworkProtocol"
    }
}
extension AddPasswordComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\AddPasswordDependency.passwordNetworkService] = "passwordNetworkService-PasswordNetworkProtocol"
    }
}
extension PasswordListComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\PasswordListDependency.folderNetworkService] = "folderNetworkService-FolderNetworkProtocol"
        keyPathToName[\PasswordListDependency.passwordNetworkService] = "passwordNetworkService-PasswordNetworkProtocol"

    }
}
extension ProfileComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\ProfileDependency.authorizationService] = "authorizationService-AuthorizationServiceProtocol"
    }
}
extension RootComponent: NeedleFoundation.Registration {
    public func registerItems() {


    }
}
extension InputPassCodeComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\InputPassCodeDependency.authorizationService] = "authorizationService-AuthorizationServiceProtocol"
    }
}
extension CreatePassCodeComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\CreatePassCodeDependency.authorizationService] = "authorizationService-AuthorizationServiceProtocol"
    }
}
extension AnalyticsComponent: NeedleFoundation.Registration {
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
    registerProviderFactory("^->RootComponent->FolderNetworkComponent", factory9eb2d8c7977e8d710c25b3a8f24c1d289f2c0f2e)
    registerProviderFactory("^->RootComponent->PasswordNetworkComponent", factory75006564c7d7c8e05e5cb3a8f24c1d289f2c0f2e)
    registerProviderFactory("^->RootComponent->AuthorizationServiceComponent", factorya33cbca5714df39a73d6e3b0c44298fc1c149afb)
    registerProviderFactory("^->RootComponent->NetworkServiceComponent", factory135f53c453d8e7c03d43e3b0c44298fc1c149afb)
    registerProviderFactory("^->RootComponent->NavigationServiceComponent", factorye0c8ac25639f48c884dab3a8f24c1d289f2c0f2e)
    registerProviderFactory("^->RootComponent->AuthComponent->RecoveryPasswordComponent", factoryf97002da1394e2ecc1cee3b0c44298fc1c149afb)
    registerProviderFactory("^->RootComponent->AuthComponent", factoryfef8ce3e5d7a6687fadeb3a8f24c1d289f2c0f2e)
    registerProviderFactory("^->RootComponent->PasswordListComponent->AddFolderComponent", factory069e68669e8bba48e413a9403e3301bb54f80df0)
    registerProviderFactory("^->RootComponent->PasswordListComponent->PasswordDetailComponent", factorycd67a93efddee2c96a09a9403e3301bb54f80df0)
    registerProviderFactory("^->RootComponent->PasswordListComponent->AddPasswordComponent", factorya87b0bd176589d7e0b68a9403e3301bb54f80df0)
    registerProviderFactory("^->RootComponent->PasswordListComponent", factorycb949510ddf8531ca17fb3a8f24c1d289f2c0f2e)
    registerProviderFactory("^->RootComponent->ProfileComponent", factory62ee3a75b16d091e8f01b3a8f24c1d289f2c0f2e)
    registerProviderFactory("^->RootComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->RootComponent->InputPassCodeComponent", factory36b6508c225fdf3e6d18b3a8f24c1d289f2c0f2e)
    registerProviderFactory("^->RootComponent->CreatePassCodeComponent", factoryb865d3d0442ff6a591b0b3a8f24c1d289f2c0f2e)
    registerProviderFactory("^->RootComponent->AnalyticsComponent", factoryf526b52b541977f192efe3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
