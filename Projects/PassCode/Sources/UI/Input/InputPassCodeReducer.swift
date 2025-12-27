//
//  InputPassCodeReducer.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.08.2025.
//

import Foundation
import UDFKit
import LocalAuthentication
import Core

struct InputPassCodeReducer: Reducer, Sendable {
    
    struct State {
        var passCode: String = ""
        var biometryType: LABiometryType
        var maxDigits: Int { get { 6 } }
        var isError: Bool = false
        var shakeAttempts: Int = 0
        
        init() {
            let context = LAContext()
            biometryType = context.biometryType
        }
    }
    
    enum Action {
        case insert(_ digit: Int)
        case delete
        case logout
        case enterWithBiometry
        
        case changeError(Bool)
    }
    
    @ThreadSafe var dependency: InputPassCodeDependency
    
    func reduce(_ state: inout State, action: Action) -> ReducerResult<Action, Never> {
        switch action {
            case let .insert(digit):
                if state.passCode.count < state.maxDigits {
                    state.passCode.append("\(digit)")
                }
                
                if state.passCode.count == state.maxDigits {
                    if dependency.authorizationService.unlock(state.passCode) == false {
                        state.isError = true
                        state.passCode = ""
                        state.shakeAttempts += 1
                        return .init(effect: .run { send in
                            try await Task.sleep(for: .milliseconds(600))
                            await send(.changeError(false))
                        })
                    }
                }
            case .delete:
                if state.passCode.isEmpty {
                    return .init(effect: .run { send in
                        await send(.enterWithBiometry)
                    })
                } else {
                    state.passCode.removeLast()
                }
            case .logout:
                dependency.authorizationService.logout()
            case .enterWithBiometry:
                let context = LAContext()
                
                var error: NSError?
                guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
                    print("Cannot evaluate: \(error?.localizedDescription ?? "Unknown error")")
                    return .init(effect: .none)
                }
                
                let reason = context.biometryType == .faceID ? "Face ID" : "Touch ID"
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                    DispatchQueue.main.async {
                        dependency.authorizationService.unlockFaceId(success)
                    }
                }
                
            case let .changeError(isError):
                state.isError = isError
        }
        
        return .init(effect: .none)
    }
}
