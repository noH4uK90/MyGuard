//
//  ThreadSafeMacro.swift
//  MyGuard
//
//  Created by Иван Спирин on 23.08.2025.
//

import Foundation

@propertyWrapper
final class ThreadSafe<Value>: @unchecked Sendable {
    private var _wrappedValue: Value
    private let lock = NSLock()
    
    init(_ wrappedValue: consuming Value) {
        _wrappedValue = wrappedValue
    }
    
    var wrappedValue: Value {
        _read {
            lock.lock()
            defer { lock.unlock() }
            
            yield _wrappedValue
        }
        _modify {
            lock.lock()
            defer { lock.unlock() }
            
            yield &_wrappedValue
        }
    }
}
