//
//  SecureStorage.swift
//  MyGuard
//
//  Created by Иван Спирин on 28.06.2025.
//

import Foundation
import Security

final class SecureStorage: Sendable {
    static let shared = SecureStorage(); private init() {}
    
    enum KeychainError: Error {
        case itemAlreadyExists
        case itemNotFound
        case errorStatus(String?)
        
        init (status: OSStatus) {
            switch status {
                case errSecSuccess:
                    self = .itemNotFound
                case errSecItemNotFound:
                    self = .itemNotFound
                default:
                    let message = SecCopyErrorMessageString(status, nil) as String?
                    self = .errorStatus(message)
            }
        }
    }
    
    func addItem(query: [CFString: Any]) throws {
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status != errSecSuccess {
            throw KeychainError(status: status)
        }
    }
    
    func findItem(query: [CFString: Any]) throws -> [CFString: Any]? {
        var query = query
        query[kSecReturnAttributes] = kCFBooleanTrue
        query[kSecReturnData] = kCFBooleanTrue
        
        var searchResult: AnyObject?
        
        let status = withUnsafeMutablePointer(to: &searchResult) {
            SecItemCopyMatching(query as CFDictionary, $0)
        }
        
        if status != errSecSuccess {
            throw KeychainError(status: status)
        } else {
            return searchResult as? [CFString: Any]
        }
    }
    
    func updateItem(query: [CFString: Any], attributesToUpdate: [CFString: Any]) throws {
        let status = SecItemUpdate(query as CFDictionary, attributesToUpdate as CFDictionary)
        
        if status != errSecSuccess {
            throw KeychainError(status: status)
        }
    }
    
    func deleteItem(query: [CFString: Any]) throws {
        let status = SecItemDelete(query as CFDictionary)
        
        if status != errSecSuccess {
            throw KeychainError(status: status)
        }
    }
}

extension SecureStorage {
    func addPassword(_ password: String, for account: String) {
        var query: [CFString: Any] = [:]
        query[kSecClass] = kSecClassGenericPassword
        query[kSecAttrAccount] = account
        query[kSecValueData] = password.data(using: .utf8)
        
        do {
            try addItem(query: query)
        } catch {
            return
        }
    }
    
    func updatePassword(_ password: String, for account: String) {
        guard let _ = getPassword(for: account) else {
            addPassword(password, for: account)
            return
        }
        
        var query: [CFString: Any] = [:]
        query[kSecClass] = kSecClassGenericPassword
        query[kSecAttrAccount] = account
        
        var attributesToUpdate: [CFString: Any] = [:]
        attributesToUpdate[kSecValueData] = password.data(using: .utf8)
        
        do {
            try updateItem(query: query, attributesToUpdate: attributesToUpdate)
        } catch {
            return
        }
    }
    
    func getPassword(for account: String) -> String? {
        var query: [CFString: Any] = [:]
        query[kSecClass] = kSecClassGenericPassword
        query[kSecAttrAccount] = account
        
        var result: [CFString: Any]?
        
        do {
            result = try findItem(query: query)
        } catch {
            return nil
        }
        
        if let data = result?[kSecValueData] as? Data {
            return String(data: data, encoding: .utf8)
        } else {
            return nil
        }
    }
    
    func deletePassword(for account: String) {
        var query: [CFString: Any] = [:]
        query[kSecClass] = kSecClassGenericPassword
        query[kSecAttrAccount] = account
        
        do {
            try deleteItem(query: query)
        } catch {
            return
        }
    }
}

