//
//  AppObserver.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.12.2025.
//

import Foundation
import UDFKit
import Combine
import UIKit

final class AppObserver {
    
    private let store: Store<AppReducer>
    private let coordiantor: AppCoordinator
    
    private var cancellables = Set<AnyCancellable>()
    private var lastState: AppReducer.UIState?
    
    init(store: Store<AppReducer>, coordinator: AppCoordinator) {
        self.store = store
        self.coordiantor = coordinator
    }
    
    @MainActor
    func start() {
        
        store.send(.onAppear)
        
        NotificationCenter.default.publisher(
            for: UIApplication.didEnterBackgroundNotification
        )
        .sink { [weak self] _ in
            self?.store.send(.changeAppPhase)
        }
        .store(in: &cancellables)
        
        NotificationCenter.default.publisher(
            for: UIApplication.didBecomeActiveNotification
        )
        .sink { [weak self] _ in
            self?.store.send(.changeAppPhase)
        }
        .store(in: &cancellables)
        
        store.$state
            .map(\.uiState)
            .removeDuplicates()
            .sink { [weak self] state in
                guard self?.lastState != state else { return }
                self?.coordiantor.handle(state)
            }
            .store(in: &cancellables)
    }
}
