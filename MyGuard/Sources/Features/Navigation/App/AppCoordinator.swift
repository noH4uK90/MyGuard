//
//  AppCoordinator.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.12.2025.
//

import UIKit
import SwiftUI

final class AppCoordinator: BaseCoordinator {
    
    private let window: UIWindow?
    private let rootCoordinator: TabBar
    private let authCoordinator: Coordinator
    private let createPassCodeComponent: CreatePassCodeComponent
    private let inputPassCodeComponent: InputPassCodeComponent
    
    init(
        scope: Any,
        window: UIWindow?,
        rootCoordinator: TabBar,
        authCoordinator: Coordinator,
        createPassCodeComponent: CreatePassCodeComponent,
        inputPassCodeComponent: InputPassCodeComponent
    ) {
        self.window = window
        self.rootCoordinator = rootCoordinator
        self.authCoordinator = authCoordinator
        self.createPassCodeComponent = createPassCodeComponent
        self.inputPassCodeComponent = inputPassCodeComponent
        super.init(scope: scope)
    }
    
    func handle(_ command: RootReducer.UIState) {
        let root: UIViewController
        
        switch command {
            case .main:
                root = makeMain()
            case .auth:
                root = makeAuth()
            case .passCode:
                root = makeinputPassCode()
            case .needPassCode:
                root = makeCreatePassCode()
        }
        
        setRoot(root)
    }
    
    private func setRoot(_ viewController: UIViewController) {
        guard window?.rootViewController !== viewController else { return }
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}

extension AppCoordinator {
    
    func makeMain() -> UIViewController {
        rootCoordinator.start()
        return rootCoordinator.tabBarController
    }
    
    func makeAuth() -> UIViewController {
        authCoordinator.start()
        return authCoordinator.navigationController
    }
    
    func makeCreatePassCode() -> UIViewController {
        return UIHostingController(rootView: createPassCodeComponent.view)
    }
    
    func makeinputPassCode() -> UIViewController {
        return UIHostingController(rootView: inputPassCodeComponent.view)
    }
}
