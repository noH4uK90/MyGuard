//
//  NavigationService.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.06.2025.
//

import Foundation
import SwiftUI

public protocol NavigationServiceProtocol: AuthorizationStateProtocol {
    var isTabBarShowing: Bool { get }
    
    func showTabBar()
    func hideTabBar()
}

internal final class NavigationService: NavigationServiceProtocol {
    private let defaults = UserDefaults.standard
    private let authorizationState: AuthorizationStateProtocol
    
    init(authState: AuthorizationStateProtocol) {
        self.authorizationState = authState
    }
    
    var isAuthorized: Bool {
        get {
            authorizationState.isAuthorized
        }
    }
    
    var isUnlocked: Bool {
        get {
            authorizationState.isUnlocked
        }
    }
    
    var hasPassCode: Bool {
        get {
            authorizationState.hasPassCode
        }
    }
    
    var isTabBarShowing: Bool {
        get {
            defaults.bool(forKey: "isTabBarShowing")
        }
    }
    
    func showTabBar() {
        defaults.set(true, forKey: "isTabBarShowing")
        NotificationCenter.default.post(name: .isTabBarShowingChanged, object: nil)
    }
    
    func hideTabBar() {
        defaults.set(false, forKey: "isTabBarShowing")
        NotificationCenter.default.post(name: .isTabBarShowingChanged, object: nil)
    }
    
    
}
