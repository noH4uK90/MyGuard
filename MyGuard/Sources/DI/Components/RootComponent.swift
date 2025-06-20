//
//  RootComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 19.06.2025.
//

import NeedleFoundation
import SwiftUI

class RootComponent: BootstrapComponent {
    
    var rootViewModel: RootViewModel {
        RootViewModel()
    }
    
    var rootView: some View {
        RootView()
    }
}

// Dependencies
extension RootComponent {
    var networkService: NetworkServiceProtocol {
        NetworkService(parent: self)
    }
}

// Root component
extension RootComponent {
    var authComponent: AuthComponent {
        return AuthComponent(parent: self)
    }
}
