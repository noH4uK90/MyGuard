//
//  PasswordCoordinatorComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.12.2025.
//

import NeedleFoundation
import UIKit
import Core

public protocol PasswordCoordinatorDependency {
    var networkService: NetworkServiceProtocol { get }
}

public final class PasswordCoordinatorComponent: BootstrapComponent {
    
    private let dependencies: PasswordCoordinatorDependency
    
    public init(dependencies: PasswordCoordinatorDependency) {
        self.dependencies = dependencies
    }
    
    lazy var navigationController: UINavigationController = {
        UINavigationController()
    }()
    
    
    public func assemble() -> Coordinator {
        PasswordCoordinator(
            scope: self,
            navigationController: navigationController,
            passwordListComponent: passwordListComponent,
            passwordDetailComponent: passwordDetailComponent,
            addPasswordComponent: addPasswordComponent,
            addFolderComponent: addFolderComponent
        )
    }
    
    public var folderNetworkService: FolderNetworkProtocol {
        shared { FolderNetworkAssembly().assemble(networkService: networkService) }
    }
    
    public var passwordNetworkService: PasswordNetworkProtocol {
        shared { PasswordNetworkAssembly().assemble(networkService: networkService) }
    }
}

extension PasswordCoordinatorComponent {

    var passwordListComponent: PasswordListComponent {
        PasswordListComponent(parent: self)
    }

    var passwordDetailComponent: PasswordDetailComponent {
        PasswordDetailComponent(parent: self)
    }

    var addPasswordComponent: AddPasswordComponent {
        AddPasswordComponent(parent: self)
    }

    var addFolderComponent: AddFolderComponent {
        AddFolderComponent(parent: self)
    }
}

extension PasswordCoordinatorComponent {
    
    var networkService: NetworkServiceProtocol {
        dependencies.networkService
    }
    
}
