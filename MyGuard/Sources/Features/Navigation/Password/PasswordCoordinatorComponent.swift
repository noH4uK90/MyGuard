//
//  PasswordCoordinatorComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.12.2025.
//

import NeedleFoundation
import UIKit

protocol PasswordCoordinatorDependency: Dependency {
    var folderNetworkService: FolderNetworkProtocol { get }
    var passwordNetworkService: PasswordNetworkProtocol { get }
}

final class PasswordCoordinatorComponent: Component<PasswordCoordinatorDependency> {
    
    lazy var navigationController: UINavigationController = {
        UINavigationController()
    }()

    func assemble() -> Coordinator {
        PasswordCoordinator(
            scope: self,
            navigationController: navigationController,
            passwordListComponent: passwordListComponent,
            passwordDetailComponent: passwordDetailComponent,
            addPasswordComponent: addPasswordComponent,
            addFolderComponent: addFolderComponent
        )
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
