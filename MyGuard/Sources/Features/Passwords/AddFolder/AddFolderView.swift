//
//  AddFolderView.swift
//  MyGuard
//
//  Created by Иван Спирин on 03.07.2025.
//

import SwiftUI
import UDFKit

struct AddFolderView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var store: StoreOf<AddFolderReducer>
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("nameTextTitle")
                    
                    Spacer()
                    
                    TextField("noneTextFieldPlaceholder", text: Binding(get: { store.name }, set: { text in store.send(.changeName(text)) }))
                        .frame(maxWidth: 200)
                        .monospaced()
                        .multilineTextAlignment(.trailing)
                }
            }
        }
        .disableSwipeBack()
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("cancleButtonTitle") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("saveButtonTitle") {
                    store.send(.save(dismiss()))
                }
                .disabled(!store.canSave)
            }
        }
    }
}
