//
//  AuthorizationService.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.06.2025.
//

import Foundation

protocol AuthorizationStateProtocol {
    var isAuthorized: Bool { get }
    var isUnlocked: Bool { get }
    var hasPassCode: Bool { get }
}

protocol AuthorizationServiceProtocol: AuthorizationStateProtocol {
    func login(_ login: String, _ password: String) async throws
    func logout()
    
    func unlockFaceId(_ status: Bool)
    func unlock(_ passCode: String) -> Bool
    func lock()
    
    func createPassCode(_ passCode: String)
    func removePassCode()
}

final class AuthorizationService: AuthorizationServiceProtocol {
    private let defaults = UserDefaults.standard
    
    private let authNetworkService: AuthNetworkProtocol
    
    init(authNetworkService: AuthNetworkProtocol) {
        self.authNetworkService = authNetworkService
    }
    
    var isAuthorized: Bool {
        get {
            defaults.bool(forKey: "isAuthorized")
        }
    }
    
    var isUnlocked: Bool {
        get {
            defaults.bool(forKey: "isUnlocked")
        }
    }
    
    var hasPassCode: Bool {
        get {
            defaults.bool(forKey: "hasPassCode")
        }
    }
    
    func login(_ login: String, _ password: String) async throws {
        let response = try await authNetworkService.authorize(login: login, password: password)
        if response.access {
            defaults.set(true, forKey: "isAuthorized")
            NotificationCenter.default.post(name: .isAuthorizedChanged, object: nil)
        }
    }
    
    func logout() {
        defaults.set(false, forKey: "isAuthorized")
        defaults.set(false, forKey: "isUnlocked")
        removePassCode()
        NotificationCenter.default.post(name: .isAuthorizedChanged, object: nil)
    }
    
    func unlockFaceId(_ status: Bool) {
        if status == true {
            defaults.set(true, forKey: "isUnlocked")
            NotificationCenter.default.post(name: .isUnlockedChanged, object: nil)
        }
    }
    
    func unlock(_ passCode: String) -> Bool {
        let storedPassCode = SecureStorage.shared.getPassword(for: "passCode") ?? ""
        
        guard passCode == storedPassCode else {
            return false
        }
        defaults.set(true, forKey: "isUnlocked")
        NotificationCenter.default.post(name: .isUnlockedChanged, object: nil)
        return true
    }
    
    func lock() {
        defaults.set(false, forKey: "isUnlocked")
        NotificationCenter.default.post(name: .isUnlockedChanged, object: nil)
    }
    
    func createPassCode(_ passCode: String) {
        SecureStorage.shared.addPassword(passCode, for: "passCode")
        defaults.set(true, forKey: "hasPassCode")
        defaults.set(true, forKey: "isUnlocked")
        NotificationCenter.default.post(name: .hasPassCodeChanged, object: nil)
    }
    
    func removePassCode() {
        SecureStorage.shared.deletePassword(for: "passCode")
        defaults.set(false, forKey: "hasPassCode")
        NotificationCenter.default.post(name: .hasPassCodeChanged, object: nil)
    }
    
}
