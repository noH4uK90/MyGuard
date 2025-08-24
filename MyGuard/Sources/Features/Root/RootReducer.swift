//
//  RootReducer.swift
//  MyGuard
//
//  Created by Иван Спирин on 21.08.2025.
//

import Foundation
import UDFKit
import NeedleFoundation

protocol RootDependency {
    var authorizationService: AuthorizationServiceProtocol { get }
    var navigationService: NavigationServiceProtocol { get }
}

struct RootReducer: Reducer, Sendable {
    
    enum UIState {
        case main
        case auth
        case passCode
        case needPassCode
    }
    
    struct State {
        var uiState: UIState = .main
        
        private var isAuthorized: Bool = false
        private var isUnlocked: Bool = false
        private var hasPassCode: Bool = false
        
        mutating func reloadAll(_ isAuthorized: Bool, _ isUnlocked: Bool, _ hasPassCode: Bool) {
            self.isAuthorized = isAuthorized
            self.isUnlocked = isUnlocked
            self.hasPassCode = hasPassCode
            changeState()
        }
        
        mutating func changeAuthorized(_ isAuthorized: Bool, _ hasPasscode: Bool, _ isUnlocked: Bool) {
            self.isAuthorized = isAuthorized
            self.hasPassCode = hasPasscode
            self.isUnlocked = isUnlocked
            changeState()
        }
        
        mutating func changeUnlocked(_ isUnlocked: Bool) {
            self.isUnlocked = isUnlocked
            changeState()
        }
        
        mutating func changePassCode(_ hasPassCode: Bool, _ isUnlocked: Bool) {
            self.hasPassCode = hasPassCode
            self.isUnlocked = isUnlocked
            changeState()
        }
        
        private mutating func changeState() {
            if !isAuthorized {
                uiState = .auth
                return
            }
            
            if !hasPassCode {
                uiState = .needPassCode
                return
            }
            
            if !isUnlocked {
                uiState = .passCode
                return
            }
            
            uiState = .main
        }
    }
    
    enum Action {
        case onAppear
        
        case authorizationChanged(Bool, Bool, Bool)
        case unlockingChanged(Bool)
        case passCodeChanged(Bool, Bool)
        case changeAppPhase
        
        case savePassCode(String)
    }
    
    @ThreadSafe var dependency: RootDependency
    
    func reduce(_ state: inout State, action: Action) -> Effect<Action> {
        switch action {
            case .onAppear:
                let isAuthorized = dependency.authorizationService.isAuthorized
                let isUnlocked = dependency.authorizationService.isUnlocked
                let hasPassCode = dependency.authorizationService.hasPassCode
                state.reloadAll(isAuthorized, isUnlocked, hasPassCode)
                return observeAll()
                
            case let .authorizationChanged(authState, hasPasscode, isUnlocked):
                state.changeAuthorized(authState, hasPasscode, isUnlocked)
            case let .unlockingChanged(unlockState):
                state.changeUnlocked(unlockState)
            case let .passCodeChanged(passCodeState, isUnlocked):
                state.changePassCode(passCodeState, isUnlocked)
            case .changeAppPhase:
                state.changeUnlocked(false)
                
            case let .savePassCode(passCode):
                dependency.authorizationService.createPassCode(passCode)
        }
        
        return .none
    }
    
    private func observeAll() -> Effect<Action> {
        .run { send in
            async let auth: Void = {
                for await _ in NotificationCenter.default.notifications(named: .isAuthorizedChanged) {
                    let authState = dependency.authorizationService.isAuthorized
                    let hasPasscode = dependency.authorizationService.hasPassCode
                    let isUnlocked = dependency.authorizationService.isUnlocked
                    await send(.authorizationChanged(authState, hasPasscode, isUnlocked))
                }
            }()
            
            async let unlock: Void = {
                for await _ in NotificationCenter.default.notifications(named: .isUnlockedChanged) {
                    let unlockState = dependency.authorizationService.isUnlocked
                    await send(.unlockingChanged(unlockState))
                }
            }()
            
            async let pass: Void = {
                for await _ in NotificationCenter.default.notifications(named: .hasPassCodeChanged) {
                    let passCodeState = dependency.authorizationService.hasPassCode
                    let isUnlocked = dependency.authorizationService.isUnlocked
                    await send(.passCodeChanged(passCodeState, isUnlocked))
                }
            }()
            
            _ = await (auth, unlock, pass)
        }
    }
}
