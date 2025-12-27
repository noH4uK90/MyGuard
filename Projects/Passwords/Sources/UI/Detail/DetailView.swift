//
//  PasswordDetailView.swift
//  MyGuard
//
//  Created by Иван Спирин on 29.06.2025.
//

import SwiftUI
import UDFKit

struct PasswordDetailView: View {

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
                    "cancelConfirmationDialogMessage",
                    isPresented: Binding(
                        get: { self.store.isShowingCancelConfirmation },
                        set: { _, _ in store.send(.cancelOnTap) }
                    )
                ) {
                    Button("cancelConfirmationDialogCancel", role: .destructive) {
                        store.send(.cancelConfirmationOnTap(true))
                    }
                    Button("cancelConfirmationDialogKeep", role: .cancel) {
                        store.send(.cancelConfirmationOnTap(false))
                    }
                }
                .confirmationDialog(
                    "deleteConfirmationDialogMessage",
                    isPresented: Binding(
                        get: { store.isShowingDeleteConfirmation },
                        set: { _, _ in store.send(.deleteOnTap) })
                ) {
                    Button("deleteConfirmationDialogDelete", role: .destructive) {
                        store.send(.deleteConfirmationOnTap(true))
                    }
                    Button("deleteConfirmationDialogKeep", role: .cancel) {
                        store.send(.deleteConfirmationOnTap(false))
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if store.uiState == .editing {
                ToolbarItem(placement: .topBarLeading) {
                    Button("cancelButtonTitle") {
                        store.send(.cancelOnTap)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("saveButtonTitle") {
                        store.send(.saveOnTap)
                    }
                    .disabled(!store.canSave)
                }
            } else {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("editButtonTitle") {
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
            Text("loginTitle")
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
            Text("passwordTitle")
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
            Text("websiteTitle")
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
