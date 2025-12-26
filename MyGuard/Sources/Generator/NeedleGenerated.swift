

import Foundation
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

private func parent2(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent.parent
}

private func parent3(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent.parent.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class FolderNetworkDependencya9da2bb55b41477e835bProvider: FolderNetworkDependency {
    var networkService: NetworkServiceProtocol {
        return appCoordinatorComponent.networkService
    }
    private let appCoordinatorComponent: AppCoordinatorComponent
    init(appCoordinatorComponent: AppCoordinatorComponent) {
        self.appCoordinatorComponent = appCoordinatorComponent
    }
}
/// ^->AppCoordinatorComponent->RootCoordinatorComponent->FolderNetworkComponent
private func factory846adb9fd23afaacae7f4fc5ad4103039915518d(_ component: NeedleFoundation.Scope) -> AnyObject {
    return FolderNetworkDependencya9da2bb55b41477e835bProvider(appCoordinatorComponent: parent2(component) as! AppCoordinatorComponent)
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
private class PasswordNetworkDependencyef36644195a28c1cdbadProvider: PasswordNetworkDependency {
    var networkService: NetworkServiceProtocol {
        return appCoordinatorComponent.networkService
    }
    private let appCoordinatorComponent: AppCoordinatorComponent
    init(appCoordinatorComponent: AppCoordinatorComponent) {
        self.appCoordinatorComponent = appCoordinatorComponent
    }
}
/// ^->AppCoordinatorComponent->RootCoordinatorComponent->PasswordNetworkComponent
private func factorye07593c6e7a89220a39a4fc5ad4103039915518d(_ component: NeedleFoundation.Scope) -> AnyObject {
    return PasswordNetworkDependencyef36644195a28c1cdbadProvider(appCoordinatorComponent: parent2(component) as! AppCoordinatorComponent)
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
private class NetworkServiceDependencya7764f7e9ad64f5457b2Provider: NetworkServiceDependency {


    init() {

    }
}
/// ^->AppCoordinatorComponent->NetworkServiceComponent
private func factorya6e135b14cbe9f5c5c05e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NetworkServiceDependencya7764f7e9ad64f5457b2Provider()
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
private class RecoveryPasswordDependency99ca31a320798f4424bfProvider: RecoveryPasswordDependency {


    init() {

    }
}
/// ^->AppCoordinatorComponent->AuthCoordinatorComponent->AuthComponent->RecoveryPasswordComponent
private func factorycf73812a687ad76be24de3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RecoveryPasswordDependency99ca31a320798f4424bfProvider()
}
private class AuthDependency1ed67e51d8e9e3406310Provider: AuthDependency {
    var authorizationService: AuthorizationServiceProtocol {
        return appCoordinatorComponent.authorizationService
    }
    private let appCoordinatorComponent: AppCoordinatorComponent
    init(appCoordinatorComponent: AppCoordinatorComponent) {
        self.appCoordinatorComponent = appCoordinatorComponent
    }
}
/// ^->AppCoordinatorComponent->AuthCoordinatorComponent->AuthComponent
private func factory763094bfd02ff8f917794fc5ad4103039915518d(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AuthDependency1ed67e51d8e9e3406310Provider(appCoordinatorComponent: parent2(component) as! AppCoordinatorComponent)
}
private class AddFolderDependencyb83710b284879732edf2Provider: AddFolderDependency {
    var folderNetworkService: FolderNetworkProtocol {
        return rootCoordinatorComponent.folderNetworkService
    }
    private let rootCoordinatorComponent: RootCoordinatorComponent
    init(rootCoordinatorComponent: RootCoordinatorComponent) {
        self.rootCoordinatorComponent = rootCoordinatorComponent
    }
}
/// ^->AppCoordinatorComponent->RootCoordinatorComponent->PasswordCoordinatorComponent->AddFolderComponent
private func factory4ed722253b894b92b6f98ec9e8775e7a57ecc6c4(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AddFolderDependencyb83710b284879732edf2Provider(rootCoordinatorComponent: parent2(component) as! RootCoordinatorComponent)
}
private class PasswordDetailDependencyb779acec025fbadbb776Provider: PasswordDetailDependency {
    var passwordNetworkService: PasswordNetworkProtocol {
        return rootCoordinatorComponent.passwordNetworkService
    }
    private let rootCoordinatorComponent: RootCoordinatorComponent
    init(rootCoordinatorComponent: RootCoordinatorComponent) {
        self.rootCoordinatorComponent = rootCoordinatorComponent
    }
}
/// ^->AppCoordinatorComponent->RootCoordinatorComponent->PasswordCoordinatorComponent->PasswordDetailComponent
private func factory57e14223c62da344d9b48ec9e8775e7a57ecc6c4(_ component: NeedleFoundation.Scope) -> AnyObject {
    return PasswordDetailDependencyb779acec025fbadbb776Provider(rootCoordinatorComponent: parent2(component) as! RootCoordinatorComponent)
}
private class AddPasswordDependency2258c73f3ebd73e2db95Provider: AddPasswordDependency {
    var passwordNetworkService: PasswordNetworkProtocol {
        return rootCoordinatorComponent.passwordNetworkService
    }
    private let rootCoordinatorComponent: RootCoordinatorComponent
    init(rootCoordinatorComponent: RootCoordinatorComponent) {
        self.rootCoordinatorComponent = rootCoordinatorComponent
    }
}
/// ^->AppCoordinatorComponent->RootCoordinatorComponent->PasswordCoordinatorComponent->AddPasswordComponent
private func factory6ad3aec09a2d8d207c6e8ec9e8775e7a57ecc6c4(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AddPasswordDependency2258c73f3ebd73e2db95Provider(rootCoordinatorComponent: parent2(component) as! RootCoordinatorComponent)
}
private class PasswordListDependencycff52aa34fe776c60068Provider: PasswordListDependency {
    var folderNetworkService: FolderNetworkProtocol {
        return rootCoordinatorComponent.folderNetworkService
    }
    var passwordNetworkService: PasswordNetworkProtocol {
        return rootCoordinatorComponent.passwordNetworkService
    }
    private let rootCoordinatorComponent: RootCoordinatorComponent
    init(rootCoordinatorComponent: RootCoordinatorComponent) {
        self.rootCoordinatorComponent = rootCoordinatorComponent
    }
}
/// ^->AppCoordinatorComponent->RootCoordinatorComponent->PasswordCoordinatorComponent->PasswordListComponent
private func factory5d2a22a51d2064eb2e3e8ec9e8775e7a57ecc6c4(_ component: NeedleFoundation.Scope) -> AnyObject {
    return PasswordListDependencycff52aa34fe776c60068Provider(rootCoordinatorComponent: parent2(component) as! RootCoordinatorComponent)
}
private class PasswordCoordinatorDependencyfd8670741978a7ac69c8Provider: PasswordCoordinatorDependency {
    var folderNetworkService: FolderNetworkProtocol {
        return rootCoordinatorComponent.folderNetworkService
    }
    var passwordNetworkService: PasswordNetworkProtocol {
        return rootCoordinatorComponent.passwordNetworkService
    }
    private let rootCoordinatorComponent: RootCoordinatorComponent
    init(rootCoordinatorComponent: RootCoordinatorComponent) {
        self.rootCoordinatorComponent = rootCoordinatorComponent
    }
}
/// ^->AppCoordinatorComponent->RootCoordinatorComponent->PasswordCoordinatorComponent
private func factory0dbcefdc1d3c44b5907dc888c27dd85b8f4ce782(_ component: NeedleFoundation.Scope) -> AnyObject {
    return PasswordCoordinatorDependencyfd8670741978a7ac69c8Provider(rootCoordinatorComponent: parent1(component) as! RootCoordinatorComponent)
}
private class AuthCoordinatorDependencycb64464a77cef7372209Provider: AuthCoordinatorDependency {
    var authorizationService: AuthorizationServiceProtocol {
        return appCoordinatorComponent.authorizationService
    }
    private let appCoordinatorComponent: AppCoordinatorComponent
    init(appCoordinatorComponent: AppCoordinatorComponent) {
        self.appCoordinatorComponent = appCoordinatorComponent
    }
}
/// ^->AppCoordinatorComponent->AuthCoordinatorComponent
private func factory2cc78d64316dbd0098f2c386e62f508005d1a9a4(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AuthCoordinatorDependencycb64464a77cef7372209Provider(appCoordinatorComponent: parent1(component) as! AppCoordinatorComponent)
}
private class ProfileCoordinatorDependencybfde7f2ea521c6973619Provider: ProfileCoordinatorDependency {
    var authorizationService: AuthorizationServiceProtocol {
        return appCoordinatorComponent.authorizationService
    }
    private let appCoordinatorComponent: AppCoordinatorComponent
    init(appCoordinatorComponent: AppCoordinatorComponent) {
        self.appCoordinatorComponent = appCoordinatorComponent
    }
}
/// ^->AppCoordinatorComponent->RootCoordinatorComponent->ProfileCoordinatorComponent
private func factory0efbe3a728436fc0c98f4fc5ad4103039915518d(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ProfileCoordinatorDependencybfde7f2ea521c6973619Provider(appCoordinatorComponent: parent2(component) as! AppCoordinatorComponent)
}
private class RootCoordinatorDependency8a925b848288b8dd5f0aProvider: RootCoordinatorDependency {
    var networkService: NetworkServiceProtocol {
        return appCoordinatorComponent.networkService
    }
    var authorizationService: AuthorizationServiceProtocol {
        return appCoordinatorComponent.authorizationService
    }
    private let appCoordinatorComponent: AppCoordinatorComponent
    init(appCoordinatorComponent: AppCoordinatorComponent) {
        self.appCoordinatorComponent = appCoordinatorComponent
    }
}
/// ^->AppCoordinatorComponent->RootCoordinatorComponent
private func factory7de6e71573705262afd9c386e62f508005d1a9a4(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RootCoordinatorDependency8a925b848288b8dd5f0aProvider(appCoordinatorComponent: parent1(component) as! AppCoordinatorComponent)
}
private class AnalyticsCoordinatorDependencyea6e471acc97a9a0003eProvider: AnalyticsCoordinatorDependency {


    init() {

    }
}
/// ^->AppCoordinatorComponent->RootCoordinatorComponent->AnalyticsCoordinatorComponent
private func factory528cb29ba8add31bc924e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AnalyticsCoordinatorDependencyea6e471acc97a9a0003eProvider()
}
private class ProfileDependency90ffc91518992861caeaProvider: ProfileDependency {
    var authorizationService: AuthorizationServiceProtocol {
        return appCoordinatorComponent.authorizationService
    }
    private let appCoordinatorComponent: AppCoordinatorComponent
    init(appCoordinatorComponent: AppCoordinatorComponent) {
        self.appCoordinatorComponent = appCoordinatorComponent
    }
}
/// ^->AppCoordinatorComponent->RootCoordinatorComponent->ProfileCoordinatorComponent->ProfileComponent
private func factory5558cbdae5c9fb2662e0e352693622dc6ffb4837(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ProfileDependency90ffc91518992861caeaProvider(appCoordinatorComponent: parent3(component) as! AppCoordinatorComponent)
}
private class RootDependencyc4ecd48694affef8e664Provider: RootDependency {
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
/// ^->AppCoordinatorComponent->RootComponent
private func factory674570e2bde8c96e130ac386e62f508005d1a9a4(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RootDependencyc4ecd48694affef8e664Provider(appCoordinatorComponent: parent1(component) as! AppCoordinatorComponent)
}
private class InputPassCodeDependency078e011cd1e5ba0d9efdProvider: InputPassCodeDependency {
    var authorizationService: AuthorizationServiceProtocol {
        return appCoordinatorComponent.authorizationService
    }
    private let appCoordinatorComponent: AppCoordinatorComponent
    init(appCoordinatorComponent: AppCoordinatorComponent) {
        self.appCoordinatorComponent = appCoordinatorComponent
    }
}
/// ^->AppCoordinatorComponent->InputPassCodeComponent
private func factory075d5268ea1e6cbd518dc386e62f508005d1a9a4(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InputPassCodeDependency078e011cd1e5ba0d9efdProvider(appCoordinatorComponent: parent1(component) as! AppCoordinatorComponent)
}
private class CreatePassCodeDependencyfc38c7dc6110a0b59ca8Provider: CreatePassCodeDependency {
    var authorizationService: AuthorizationServiceProtocol {
        return appCoordinatorComponent.authorizationService
    }
    private let appCoordinatorComponent: AppCoordinatorComponent
    init(appCoordinatorComponent: AppCoordinatorComponent) {
        self.appCoordinatorComponent = appCoordinatorComponent
    }
}
/// ^->AppCoordinatorComponent->CreatePassCodeComponent
private func factoryd5ca23f8dffa81138c76c386e62f508005d1a9a4(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CreatePassCodeDependencyfc38c7dc6110a0b59ca8Provider(appCoordinatorComponent: parent1(component) as! AppCoordinatorComponent)
}
private class AnalyticsDependency129b0001d6e22242cb9eProvider: AnalyticsDependency {


    init() {

    }
}
/// ^->AppCoordinatorComponent->RootCoordinatorComponent->AnalyticsCoordinatorComponent->AnalyticsComponent
private func factory2e18375c93c27635758ae3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AnalyticsDependency129b0001d6e22242cb9eProvider()
}

#else
extension FolderNetworkComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\FolderNetworkDependency.networkService] = "networkService-NetworkServiceProtocol"
    }
}
extension AuthNetworkComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\AuthNetworkDependency.networkService] = "networkService-NetworkServiceProtocol"
    }
}
extension PasswordNetworkComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\PasswordNetworkDependency.networkService] = "networkService-NetworkServiceProtocol"
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
extension PasswordCoordinatorComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\PasswordCoordinatorDependency.folderNetworkService] = "folderNetworkService-FolderNetworkProtocol"
        keyPathToName[\PasswordCoordinatorDependency.passwordNetworkService] = "passwordNetworkService-PasswordNetworkProtocol"

    }
}
extension AppCoordinatorComponent: NeedleFoundation.Registration {
    public func registerItems() {


    }
}
extension AuthCoordinatorComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\AuthCoordinatorDependency.authorizationService] = "authorizationService-AuthorizationServiceProtocol"

    }
}
extension ProfileCoordinatorComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\ProfileCoordinatorDependency.authorizationService] = "authorizationService-AuthorizationServiceProtocol"

    }
}
extension RootCoordinatorComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\RootCoordinatorDependency.networkService] = "networkService-NetworkServiceProtocol"
        keyPathToName[\RootCoordinatorDependency.authorizationService] = "authorizationService-AuthorizationServiceProtocol"

    }
}
extension AnalyticsCoordinatorComponent: NeedleFoundation.Registration {
    public func registerItems() {


    }
}
extension ProfileComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\ProfileDependency.authorizationService] = "authorizationService-AuthorizationServiceProtocol"
    }
}
extension RootComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\RootDependency.authorizationService] = "authorizationService-AuthorizationServiceProtocol"
        keyPathToName[\RootDependency.navigationService] = "navigationService-NavigationServiceProtocol"
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
    registerProviderFactory("^->AppCoordinatorComponent->RootCoordinatorComponent->FolderNetworkComponent", factory846adb9fd23afaacae7f4fc5ad4103039915518d)
    registerProviderFactory("^->AppCoordinatorComponent->AuthNetworkComponent", factory704bd77dddaf223a0a2bc386e62f508005d1a9a4)
    registerProviderFactory("^->AppCoordinatorComponent->RootCoordinatorComponent->PasswordNetworkComponent", factorye07593c6e7a89220a39a4fc5ad4103039915518d)
    registerProviderFactory("^->AppCoordinatorComponent->AuthorizationServiceComponent", factory35f81ac66616561eaab2c386e62f508005d1a9a4)
    registerProviderFactory("^->AppCoordinatorComponent->NetworkServiceComponent", factorya6e135b14cbe9f5c5c05e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppCoordinatorComponent->NavigationServiceComponent", factory466c7c085009a699f29fc386e62f508005d1a9a4)
    registerProviderFactory("^->AppCoordinatorComponent->AuthCoordinatorComponent->AuthComponent->RecoveryPasswordComponent", factorycf73812a687ad76be24de3b0c44298fc1c149afb)
    registerProviderFactory("^->AppCoordinatorComponent->AuthCoordinatorComponent->RecoveryPasswordComponent", factorycf73812a687ad76be24de3b0c44298fc1c149afb)
    registerProviderFactory("^->AppCoordinatorComponent->AuthCoordinatorComponent->AuthComponent", factory763094bfd02ff8f917794fc5ad4103039915518d)
    registerProviderFactory("^->AppCoordinatorComponent->RootCoordinatorComponent->PasswordCoordinatorComponent->AddFolderComponent", factory4ed722253b894b92b6f98ec9e8775e7a57ecc6c4)
    registerProviderFactory("^->AppCoordinatorComponent->RootCoordinatorComponent->PasswordCoordinatorComponent->PasswordDetailComponent", factory57e14223c62da344d9b48ec9e8775e7a57ecc6c4)
    registerProviderFactory("^->AppCoordinatorComponent->RootCoordinatorComponent->PasswordCoordinatorComponent->AddPasswordComponent", factory6ad3aec09a2d8d207c6e8ec9e8775e7a57ecc6c4)
    registerProviderFactory("^->AppCoordinatorComponent->RootCoordinatorComponent->PasswordCoordinatorComponent->PasswordListComponent", factory5d2a22a51d2064eb2e3e8ec9e8775e7a57ecc6c4)
    registerProviderFactory("^->AppCoordinatorComponent->RootCoordinatorComponent->PasswordCoordinatorComponent", factory0dbcefdc1d3c44b5907dc888c27dd85b8f4ce782)
    registerProviderFactory("^->AppCoordinatorComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AppCoordinatorComponent->AuthCoordinatorComponent", factory2cc78d64316dbd0098f2c386e62f508005d1a9a4)
    registerProviderFactory("^->AppCoordinatorComponent->RootCoordinatorComponent->ProfileCoordinatorComponent", factory0efbe3a728436fc0c98f4fc5ad4103039915518d)
    registerProviderFactory("^->AppCoordinatorComponent->RootCoordinatorComponent", factory7de6e71573705262afd9c386e62f508005d1a9a4)
    registerProviderFactory("^->AppCoordinatorComponent->RootCoordinatorComponent->AnalyticsCoordinatorComponent", factory528cb29ba8add31bc924e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppCoordinatorComponent->RootCoordinatorComponent->ProfileCoordinatorComponent->ProfileComponent", factory5558cbdae5c9fb2662e0e352693622dc6ffb4837)
    registerProviderFactory("^->AppCoordinatorComponent->RootComponent", factory674570e2bde8c96e130ac386e62f508005d1a9a4)
    registerProviderFactory("^->AppCoordinatorComponent->InputPassCodeComponent", factory075d5268ea1e6cbd518dc386e62f508005d1a9a4)
    registerProviderFactory("^->AppCoordinatorComponent->CreatePassCodeComponent", factoryd5ca23f8dffa81138c76c386e62f508005d1a9a4)
    registerProviderFactory("^->AppCoordinatorComponent->RootCoordinatorComponent->AnalyticsCoordinatorComponent->AnalyticsComponent", factory2e18375c93c27635758ae3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
