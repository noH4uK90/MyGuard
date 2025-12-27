//
//  ProfileCoordinator.swift
//  MyGuard
//
//  Created by Иван Спирин on 12/26/25.
//

import UIKit
import SwiftUI
import Core

final class ProfileCoordinator: BaseCoordinator, Coordinator {
    
    let navigationController: UINavigationController
    
    private let profileComponent: ProfileComponent
    
    init(
        scope: Any,
        navigationController: UINavigationController,
        profileComponent: ProfileComponent
    ) {
        self.navigationController = navigationController
        self.profileComponent = profileComponent
        super.init(scope: scope)
    }
    
    func start() {
        makeProfile()
    }
    
    func handle(_ command: ProfileDestinationCommand) {
        
    }
}

extension ProfileCoordinator {
    
    func makeProfile() {
        let store = profileComponent.store
        let view = profileComponent.view(store: store)
        let vc = UIHostingController(rootView: view)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.setViewControllers([vc], animated: true)
    }
}
