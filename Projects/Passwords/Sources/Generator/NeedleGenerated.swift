

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

private class AddFolderDependency1e5c129bb335e46fccc7Provider: AddFolderDependency {
    var folderNetworkService: FolderNetworkProtocol {
        return passwordCoordinatorComponent.folderNetworkService
    }
    private let passwordCoordinatorComponent: PasswordCoordinatorComponent
    init(passwordCoordinatorComponent: PasswordCoordinatorComponent) {
        self.passwordCoordinatorComponent = passwordCoordinatorComponent
    }
}
/// ^->PasswordCoordinatorComponent->AddFolderComponent
private func factory8a9c1959068962719d5da354b981609edaf3e64b(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AddFolderDependency1e5c129bb335e46fccc7Provider(passwordCoordinatorComponent: parent1(component) as! PasswordCoordinatorComponent)
}
private class PasswordDetailDependencye1a2f5ae6be469026082Provider: PasswordDetailDependency {
    var passwordNetworkService: PasswordNetworkProtocol {
        return passwordCoordinatorComponent.passwordNetworkService
    }
    private let passwordCoordinatorComponent: PasswordCoordinatorComponent
    init(passwordCoordinatorComponent: PasswordCoordinatorComponent) {
        self.passwordCoordinatorComponent = passwordCoordinatorComponent
    }
}
/// ^->PasswordCoordinatorComponent->PasswordDetailComponent
private func factoryb79fbac794e361cc147fa354b981609edaf3e64b(_ component: NeedleFoundation.Scope) -> AnyObject {
    return PasswordDetailDependencye1a2f5ae6be469026082Provider(passwordCoordinatorComponent: parent1(component) as! PasswordCoordinatorComponent)
}
private class AddPasswordDependency5f34433f220c0acd5d3cProvider: AddPasswordDependency {
    var passwordNetworkService: PasswordNetworkProtocol {
        return passwordCoordinatorComponent.passwordNetworkService
    }
    private let passwordCoordinatorComponent: PasswordCoordinatorComponent
    init(passwordCoordinatorComponent: PasswordCoordinatorComponent) {
        self.passwordCoordinatorComponent = passwordCoordinatorComponent
    }
}
/// ^->PasswordCoordinatorComponent->AddPasswordComponent
private func factoryfa56909ca65927c0ad4ca354b981609edaf3e64b(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AddPasswordDependency5f34433f220c0acd5d3cProvider(passwordCoordinatorComponent: parent1(component) as! PasswordCoordinatorComponent)
}
private class PasswordListDependency2d61793286b422c5dcb2Provider: PasswordListDependency {
    var folderNetworkService: FolderNetworkProtocol {
        return passwordCoordinatorComponent.folderNetworkService
    }
    var passwordNetworkService: PasswordNetworkProtocol {
        return passwordCoordinatorComponent.passwordNetworkService
    }
    private let passwordCoordinatorComponent: PasswordCoordinatorComponent
    init(passwordCoordinatorComponent: PasswordCoordinatorComponent) {
        self.passwordCoordinatorComponent = passwordCoordinatorComponent
    }
}
/// ^->PasswordCoordinatorComponent->PasswordListComponent
private func factory3c40ac25e8de582bffbaa354b981609edaf3e64b(_ component: NeedleFoundation.Scope) -> AnyObject {
    return PasswordListDependency2d61793286b422c5dcb2Provider(passwordCoordinatorComponent: parent1(component) as! PasswordCoordinatorComponent)
}

#else
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

        localTable["folderNetworkService-FolderNetworkProtocol"] = { [unowned self] in self.folderNetworkService as Any }
        localTable["passwordNetworkService-PasswordNetworkProtocol"] = { [unowned self] in self.passwordNetworkService as Any }
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
    registerProviderFactory("^->PasswordCoordinatorComponent->AddFolderComponent", factory8a9c1959068962719d5da354b981609edaf3e64b)
    registerProviderFactory("^->PasswordCoordinatorComponent->PasswordDetailComponent", factoryb79fbac794e361cc147fa354b981609edaf3e64b)
    registerProviderFactory("^->PasswordCoordinatorComponent->AddPasswordComponent", factoryfa56909ca65927c0ad4ca354b981609edaf3e64b)
    registerProviderFactory("^->PasswordCoordinatorComponent->PasswordListComponent", factory3c40ac25e8de582bffbaa354b981609edaf3e64b)
    registerProviderFactory("^->PasswordCoordinatorComponent", factoryEmptyDependencyProvider)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
