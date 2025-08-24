//
//  PasswordDetailView.swift
//  MyGuard
//
//  Created by Иван Спирин on 29.06.2025.
//

import SwiftUI
import UDFKit

struct PasswordDetailView: View {
    
    @Environment(\.dismiss) var dismiss

    @ObservedObject var store: StoreOf<PasswordDetailReducer>

    @State private var showPassword = false

    var body: some View {
        Form {
            switch store.uiState {
            case .loading:
                ProgressView()
            case .detail:
                Section {
                    nameContent
                    loginContent
                    passwordContent
                    if store.draft.url.isEmpty == false {
                        websiteContent
                    }
                    if store.draft.note.isEmpty == false {
                        noteContent
                    }
                }
            case .editing:
                EditPasswordView(
                    draft: store.draft,
                    draftChange: { store.send(.changeText($0, $1)) },
                    delete: { store.send(.deleteOnTap) }
                )
                .disableSwipeBack()
                .navigationBarBackButtonHidden()
                .confirmationDialog(
                    "You will losee the changes you made.",
                    isPresented: Binding(
                        get: { self.store.isShowingCancelConfirmation },
                        set: { _, _ in store.send(.cancelOnTap) }
                    )
                ) {
                    Button("Discard Changed", role: .destructive) {
                        store.send(.cancelConfirmationOnTap(true))
                    }
                    Button("Continue Editing", role: .cancel) {
                        store.send(.cancelConfirmationOnTap(false))
                    }
                }
                .confirmationDialog(
                    "This password will be permanently deleted.",
                    isPresented: Binding(
                        get: { store.isShowingDeleteConfirmation },
                        set: { _, _ in store.send(.deleteOnTap) })
                ) {
                    Button("Delete Password", role: .destructive) {
                        store.send(.deleteConfirmationOnTap(true, dismiss()))
                    }
                    Button("Cancel", role: .cancel) {
                        store.send(.deleteConfirmationOnTap(false, dismiss()))
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if store.uiState == .editing {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        store.send(.cancelOnTap)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        store.send(.saveOnTap)
                    }
                    .disabled(!store.canSave)
                }
            } else {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Edit") {
                        store.send(.editOnTap)
                    }
                    .disabled(store.uiState != .detail)
                }
            }
        }
        .onAppear {
            store.send(.load)
        }
    }

    var nameContent: some View {
        VStack {
            Text(store.draft.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .center)
            Text("")
                .font(.caption2)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.top)
    }

    var loginContent: some View {
        HStack(alignment: .center) {
            Text("Login")
                .font(.title3)
            Spacer()
            Text(store.draft.login)
                .font(.headline)
                .foregroundStyle(.secondary)
                .monospaced()
                .lineLimit(1)
        }
    }

    var passwordContent: some View {
        HStack(alignment: .center) {
            Text("Password")
                .font(.title3)
            Spacer()
            if showPassword {
                Text(store.draft.password)
                    .frame(maxWidth: 200)
                    .font(.headline)
                    .foregroundStyle(.secondary)
                    .monospaced()
                    .lineLimit(1)
                    .textSelection(.enabled)
            } else {
                HStack {
                    ForEach(0..<store.draft.password.count, id: \.self) {
                        _ in
                        Circle()
                            .frame(width: 6, height: 6)
                            .foregroundStyle(.secondary)
                            .monospaced()
                    }
                }
                .frame(maxWidth: 200)
                .lineLimit(1)
            }
        }
        .onTapGesture {
            showPassword = true
        }
    }

    var websiteContent: some View {
        HStack(alignment: .center) {
            Text("Website")
            Spacer()
            Text(store.draft.url)
                .font(.callout)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
                .lineLimit(1)
        }
    }

    var noteContent: some View {
        Text(store.draft.note)
            .fontWeight(.medium)
            .foregroundStyle(.secondary)
    }
}
