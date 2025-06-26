//
//  RootView.swift
//  MyGuard
//
//  Created by Иван Спирин on 19.06.2025.
//

import SwiftUI

struct RootView<Auth: ViewsBuilder, Analytics: ViewsBuilder, Profile: ViewsBuilder, PasswordList: ViewsBuilder>: View {
    
    @ObservedObject var viewModel: RootViewModel
    
    @State var searchText: String = ""
    
    var authBuilder: Auth
    var analyticsBuilder: Analytics
    var profileBuilder: Profile
    var passwordListBuilder: PasswordList
    
    var body: some View {
        Group {
            switch viewModel.isAuthorized {
                case true:
                    tabView
                case false:
                    NavigationStack {
                        authBuilder.view
                    }
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
                    passwordListBuilder.view
                }
            }
            
            Tab("Analytics", systemImage: "chart.bar") {
                NavigationStack {
                    analyticsBuilder.view
                }
            }
            
            Tab("Profile", systemImage: "person.circle") {
                NavigationStack {
                    profileBuilder.view
                }
            }
            
            Tab("Search", systemImage: "magnifyingglass", role: .search) {
                NavigationStack {
                    passwordListBuilder.view
                }
                .searchable(text: $searchText)
            }
        }
        .tabBarMinimizeBehavior(.onScrollDown)
    }
    
    // MARK: - Legacy TabView
    
    var legacyTabView: some View {
        TabView {
            NavigationStack {
                passwordListBuilder.view
            }
                .tabItem {
                    Label("Passwords", systemImage: "key")
                        .symbolVariant(.circle)
                }
            
            NavigationStack {
                analyticsBuilder.view
            }
                .tabItem {
                    Label("Analytics", systemImage: "chart.bar")
                }
            
            NavigationStack {
                profileBuilder.view
            }
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}
