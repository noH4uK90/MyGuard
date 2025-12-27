//
//  AppDelegate.swift
//  App
//
//  Created by Иван Спирин on 12/27/25.
//

import UIKit
import UDFKit
import Core
import Analytics
import Auth
import PassCode
import Passwords
import Profile
import TabBar

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator!
    var appObserver: AppObserver!

    override init() {
        registerProviderFactories()
        Analytics.registerProviderFactories()
        Auth.registerProviderFactories()
        PassCode.registerProviderFactories()
        Passwords.registerProviderFactories()
        Profile.registerProviderFactories()
        TabBar.registerProviderFactories()
        AppConfig.shared.setupToken()
    }

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication
            .LaunchOptionsKey: Any]?
    ) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)

        let coordinatorComponent = AppCoordinatorComponent()
        appCoordinator = coordinatorComponent.appCoordinator(window)
        appObserver = coordinatorComponent.appObserver(
            store: Store(
                state: AppReducer.State(),
                reducer: AppReducer(
                    dependency: ThreadSafe(coordinatorComponent.appComponent.dependency)
                )
            ),
            coordinator: appCoordinator
        )

        appObserver.start()

        return true
    }
}
