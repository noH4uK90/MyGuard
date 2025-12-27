//
//  AppCoordinator.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.12.2025.
//

import UIKit
import SwiftUI
import Core
import PassCode

final class AppCoordinator: BaseCoordinator {
    
    private let window: UIWindow?
    private let tabBarCoordinator: TabBarProto
    private let authCoordinator: Coordinator
    private let createPassCodeComponent: CreatePassCodeComponent
    private let inputPassCodeComponent: InputPassCodeComponent
    
    init(
        scope: Any,
        window: UIWindow?,
        tabBarCoordinator: TabBarProto,
        authCoordinator: Coordinator,
        createPassCodeComponent: CreatePassCodeComponent,
        inputPassCodeComponent: InputPassCodeComponent
    ) {
        self.window = window
        self.tabBarCoordinator = tabBarCoordinator
        self.authCoordinator = authCoordinator
        self.createPassCodeComponent = createPassCodeComponent
        self.inputPassCodeComponent = inputPassCodeComponent
        super.init(scope: scope)
    }
    
    func handle(_ command: AppReducer.UIState) {
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
        tabBarCoordinator.start()
        return tabBarCoordinator.tabBarController
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
