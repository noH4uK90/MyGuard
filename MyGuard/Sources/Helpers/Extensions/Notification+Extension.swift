//
//  NotificationCenter.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.06.2025.
//

import Foundation

extension Notification.Name {
    static let isAuthorizedChanged = Notification.Name("isAuthorizedChanged")
    
    static let isTabBarShowingChanged = Notification.Name("isTabBarShowingChanged")
    
    static let isUnlockedChanged = Notification.Name("isUnlockedChanged")
    
    static let hasPassCodeChanged = Notification.Name("hasPassCodeChanged")
}
