//
//  PasswordCoordinator.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.12.2025.
//

import UIKit
import SwiftUI

final class PasswordCoordinator: BaseCoordinator, Coordinator {
    
    let navigationController: UINavigationController
    
    private let passwordListComponent: PasswordListComponent
    private let passwordDetailComponent: PasswordDetailComponent
    private let addPasswordComponent: AddPasswordComponent
    private let addFolderComponent: AddFolderComponent
    
    init(
        scope: Any,
        navigationController: UINavigationController,
        passwordListComponent: PasswordListComponent,
        passwordDetailComponent: PasswordDetailComponent,
        addPasswordComponent: AddPasswordComponent,
        addFolderComponent: AddFolderComponent
    ) {
        self.navigationController = navigationController
        self.passwordListComponent = passwordListComponent
        self.passwordDetailComponent = passwordDetailComponent
        self.addPasswordComponent = addPasswordComponent
        self.addFolderComponent = addFolderComponent
        super.init(scope: scope)
    }
    
    func start() {
        navigationController.navigationBar.prefersLargeTitles = true
        makeList()
    }
    
    func handle(_ command: PasswordDestinationCommand) {
        switch command {
            case let .detail(id):
                makeDetail(id)
            case let .addPassword(id):
                makeAddPassword(id)
            case let .addFolder(id):
                makeAddFolder(id)
            case .pop:
                navigationController.popViewController(animated: true)
        }
    }
}

extension PasswordCoordinator {
    
    func makeList() {
        let store = passwordListComponent.store
        store.onOutput = { [weak self] command in
            switch command {
                case let .openDetail(id):
                    self?.handle(.detail(id))
                case let .openAddPasswordForm(id):
                    self?.handle(.addPassword(id))
                case let .openAddFolderForm(id):
                    self?.handle(.addFolder(id))
            }
        }
        let view = passwordListComponent.view(store: store)
        let vc = UIHostingController(rootView: view)
        vc.navigationItem.title = String(localized: "passwordTabTitle")
        navigationController.setViewControllers([vc], animated: true)
    }
    
    func makeDetail(_ id: Int) {
        let store = passwordDetailComponent.store(id: id)
        store.onOutput = { [weak self] command in
            switch command {
                case let .deleteRequested(id):
                    Task { @MainActor in
                        let listStore = self?.passwordListComponent.store
                        listStore?.send(.deletePassword(id))
                        self?.handle(.pop)
                    }
            }
        }
        let view = passwordDetailComponent.view(store: store)
        let vc = UIHostingController(rootView: view)
        vc.hidesBottomBarWhenPushed = true
        navigationController.pushViewController(vc, animated: true)
    }
    
    func makeAddPassword(_ id: Int) {
        let store = addPasswordComponent.store(folderId: id)
        store.onOutput = { [weak self] command in
            switch command {
                case let .addPasswordRequest(password):
                    Task { @MainActor in
                        let listStore = self?.passwordListComponent.store
                        listStore?.send(.addPassword(password))
                        self?.handle(.pop)
                    }
            }
        }
        let view = addPasswordComponent.view(store: store)
        let vc = UIHostingController(rootView: view)
        vc.navigationItem.title = String(localized: "addPasswordTitle")
        vc.hidesBottomBarWhenPushed = true
        navigationController.pushViewController(vc, animated: true)
    }
    
    func makeAddFolder(_ id: Int) {
        let store = addFolderComponent.store(folderId: id)
        store.onOutput = { [weak self] command in
            switch command {
                case let .addFolderRequest(folder):
                    Task { @MainActor in
                        let listStore = self?.passwordListComponent.store
                        listStore?.send(.addFolder(folder))
                        self?.handle(.pop)
                    }
            }
        }
        let view = addFolderComponent.view(store: store)
        let vc = UIHostingController(rootView: view)
        vc.navigationItem.title = String(localized: "addFolderTitle")
        vc.hidesBottomBarWhenPushed = true
        navigationController.pushViewController(vc, animated: true)
    }
}
