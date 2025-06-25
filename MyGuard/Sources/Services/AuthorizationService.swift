//
//  AuthorizationService.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.06.2025.
//

import Foundation

protocol AuthorizationStateProtocol {
    var isAuthorized: Bool { get }
}

protocol AuthorizationServiceProtocol: AuthorizationStateProtocol {
    func login()
    func logout()
}

final class AuthorizationService: AuthorizationServiceProtocol {
    private let defaults = UserDefaults.standard
    
    var isAuthorized: Bool {
        get {
            defaults.bool(forKey: "isAuthorized")
        }
    }
    
    func login() {
        defaults.set(true, forKey: "isAuthorized")
        NotificationCenter.default.post(name: .isAuthorizedChanged, object: nil)
    }
    
    func logout() {
        defaults.set(false, forKey: "isAuthorized")
        NotificationCenter.default.post(name: .isAuthorizedChanged, object: nil)
    }
    
}
