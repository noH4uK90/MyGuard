//
//  NotificationCenter.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.06.2025.
//

import Foundation

extension Notification.Name {
    public static let isAuthorizedChanged = Notification.Name("isAuthorizedChanged")
    
    public static let isTabBarShowingChanged = Notification.Name("isTabBarShowingChanged")
    
    public static let isUnlockedChanged = Notification.Name("isUnlockedChanged")
    
    public static let hasPassCodeChanged = Notification.Name("hasPassCodeChanged")
}
