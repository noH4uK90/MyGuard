//
//  RootViewModel.swift
//  MyGuard
//
//  Created by Иван Спирин on 19.06.2025.
//

import Foundation

final class RootViewModel: ObservableObject {
    
    @Published var isAuthorized: Bool = false
    @Published var isTabBarShowing: Bool = false
    
    private let authorizationService: AuthorizationServiceProtocol
    private let navigationService: NavigationServiceProtocol
    
    private var authorizationTask: Task<Void, Never>?
    private var showingTabBarTask: Task<Void, Never>?
    
    init(authorizationService: AuthorizationServiceProtocol, navigationService: NavigationServiceProtocol) {
        self.authorizationService = authorizationService
        self.navigationService = navigationService
        authorizationTask = observeAuthorization()
    }
    
    deinit {
        print("Root ViewModel deinited")
        authorizationTask?.cancel()
    }
    
    func logout() {
        authorizationService.logout()
    }
    
    func showTabBar() {
        navigationService.showTabBar()
    }
    
    func hideTabBar() {
        navigationService.hideTabBar()
    }
    
    @discardableResult
    private func observeAuthorization() -> Task<Void, Never> {
        Task { [weak self] in
            guard let self = self else { return }
            let notification = NotificationCenter.default.notifications(named: .isAuthorizedChanged)
            for await _ in notification {
                await MainActor.run {
                    self.isAuthorized = self.navigationService.isAuthorized
                }
            }
        }
    }
    
    @discardableResult
    private func observeTabBar() -> Task<Void, Never> {
        Task { [weak self] in
            guard let self = self else { return }
            let notification = NotificationCenter.default.notifications(named: .isTabBarShowingChanged)
            for await _ in notification {
                await MainActor.run {
                    self.isTabBarShowing = self.navigationService.isTabBarShowing
                }
            }
        }
    }
}
