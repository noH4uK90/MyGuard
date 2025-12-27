//
//  AddPasswordView.swift
//  MyGuard
//
//  Created by Иван Спирин on 03.07.2025.
//

import SwiftUI
import UDFKit
import Core

struct AddPasswordView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var store: StoreOf<AddPasswordReducer>
    
    var body: some View {
        Form {
            EditPasswordView(
                draft: store.draft,
                draftChange: { keyPath, text in
                    store.send(.draftChange(keyPath: keyPath, text))
                }
            )
        }
        .disableSwipeBack()
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("cancelButtonTitle") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .confirmationAction) {
                Button("saveButtonTitle") {
                    store.send(.save)
                }
                .disabled(!store.canSave)
            }
        }
    }
}
