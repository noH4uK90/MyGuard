//
//  RootView.swift
//  MyGuard
//
//  Created by Иван Спирин on 19.06.2025.
//

import SwiftUI

struct RootView<AuthView: AuthBuilder>: View {
    
    @ObservedObject var viewModel: RootViewModel
    
    var authBuilder: AuthView
    
    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.isAuthorized {
                    case true:
                        Button("Logout") {
                            viewModel.logout()
                        }
                    case false:
                        authBuilder.authView
                }
            }
        }
    }
}
