//
//  SecureStorage.swift
//  MyGuard
//
//  Created by Иван Спирин on 28.06.2025.
//

import SwiftUI

@propertyWrapper
struct Password: DynamicProperty {
    private let key: String
    private let storage: SecureStorage = .shared
    
    public init(_ key: String) {
        self.key = key
    }
    
    public var wrappedValue: String? {
        get { storage.getPassword(for: key) }
        nonmutating set {
            if let newValue {
                storage.updatePassword(newValue, for: key)
            } else {
                storage.deletePassword(for: key)
            }
        }
    }
    
}
