//
//  RootViewModel.swift
//  MyGuard
//
//  Created by Иван Спирин on 19.06.2025.
//

import Foundation

final class RootViewModel: ObservableObject {
    
    @Published var isAuthorized: Bool = false
    
    let authorizationService: AuthorizationServiceProtocol
    
    private var authorizationTask: Task<Void, Never>?
    
    init(authorizationService: AuthorizationServiceProtocol) {
        self.authorizationService = authorizationService
        authorizationTask = observeAuthorization()
    }
    
    deinit {
        print("Root ViewModel deinited")
        authorizationTask?.cancel()
    }
    
    func logout() {
        authorizationService.logout()
    }
    
    @discardableResult
    private func observeAuthorization() -> Task<Void, Never> {
        Task { [weak self] in
            guard let self = self else { return }
            let notification = NotificationCenter.default.notifications(named: .isAuthorizedChanged)
            for await _ in notification {
                await MainActor.run {
                    self.isAuthorized = self.authorizationService.isAuthorized
                }
            }
        }
    }
}
