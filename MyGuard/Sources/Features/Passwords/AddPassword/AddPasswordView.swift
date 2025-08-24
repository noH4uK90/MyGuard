//
//  AddPasswordView.swift
//  MyGuard
//
//  Created by Иван Спирин on 03.07.2025.
//

import SwiftUI
import UDFKit

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
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    store.send(.save(dismiss()))
                }
                .disabled(!store.canSave)
            }
        }
    }
}
