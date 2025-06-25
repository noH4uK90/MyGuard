//
//  RootView.swift
//  MyGuard
//
//  Created by Иван Спирин on 19.06.2025.
//

import SwiftUI

struct RootView<AuthView: AuthBuilder>: View {
    
    @ObservedObject var viewModel: RootViewModel
    
    @State var searchText: String = ""
    
    var authBuilder: AuthView
    
    var body: some View {
        Group {
            switch viewModel.isAuthorized {
                case true:
                    tabView
                case false:
                    authBuilder.authView
            }
        }
    }
    
    @ViewBuilder
    var tabView: some View {
        if #available(iOS 26, *) {
            modernTabView
        } else {
            legacyTabView
        }
    }
    
    // MARK: - Modern TabView
    
    @available(iOS 26, *)
    @ViewBuilder
    var modernTabView: some View {
        TabView {
            Tab("Passwords", systemImage: "key.shield") {
                NavigationStack {
                    
                }
            }
            
            Tab("Analytics", systemImage: "chart.bar") {
                NavigationStack {
                    
                }
            }
            
            Tab("Profile", systemImage: "person.circle") {
                NavigationStack {
                    
                }
            }
        }
    }
    
    // MARK: - Legacy TabView
    
    var legacyTabView: some View {
        TabView {
            NavigationStack {
                Text("Passwords")
            }
                .tabItem {
                    Label("Passwords", systemImage: "key")
                        .symbolVariant(.circle)
                }
            
            NavigationStack {
                Text("Analytics")
            }
                .tabItem {
                    Label("Analytics", systemImage: "chart.bar")
                }
            
            NavigationStack {
                Text("Profile")
            }
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}
