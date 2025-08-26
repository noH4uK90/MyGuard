//
//  RootView.swift
//  MyGuard
//
//  Created by Иван Спирин on 19.06.2025.
//

import SwiftUI
import UDFKit

struct RootView<
    Auth: ViewsBuilder,
    Analytics: ViewsBuilder,
    Profile: ViewsBuilder,
    PasswordList: ViewsBuilder,
    InputPassCode: ViewsBuilder,
    CreatePassCode: ViewsBuilder
>: View {

    @ObservedObject var store: StoreOf<RootReducer>

    @State var searchText: String = ""

    var authBuilder: Auth
    var analyticsBuilder: Analytics
    var profileBuilder: Profile
    var passwordListBuilder: PasswordList
    var inputPassCodeBuilder: InputPassCode
    var createPassCodeBuilder: CreatePassCode

    var body: some View {
        Group {
            switch store.uiState {
                case .main:
                    legacyTabView
                case .auth:
                    NavigationStack {
                        authBuilder.view
                    }
                case .passCode:
                    inputPassCodeBuilder.view
                case .needPassCode:
                    createPassCodeBuilder.view
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didEnterBackgroundNotification)) { _ in
            store.send(.changeAppPhase)
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
            store.send(.changeAppPhase)
        }
        .onAppear {
            store.send(.onAppear)
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
            Tab("passwordTabTitle", systemImage: "key.shield", role: .search) {
                NavigationStack {
                    passwordListBuilder.view
                        .searchable(text: $searchText)
                }
            }

            Tab("profileTabTitle", systemImage: "person.circle") {
                NavigationStack {
                    profileBuilder.view
                }
            }

            Tab("analyticsTabTitle", systemImage: "chart.bar") {
                NavigationStack {
                    analyticsBuilder.view
                }
            }
        }
        .tabBarMinimizeBehavior(.onScrollDown)
    }

    // MARK: - Legacy TabView
    var legacyTabView: some View {
        TabView {
            NavigationStack {
                passwordListBuilder.view
                    .searchable(text: $searchText)
            }
            .tabItem {
                Label("passwordTabTitle", systemImage: "key")
                    .symbolVariant(.circle)
            }

            NavigationStack {
                analyticsBuilder.view
            }
            .tabItem {
                Label("analyticsTabTitle", systemImage: "chart.bar")
            }

            NavigationStack {
                profileBuilder.view
            }
            .tabItem {
                Label("profileTabTitle", systemImage: "person.circle")
            }
        }
    }
}
