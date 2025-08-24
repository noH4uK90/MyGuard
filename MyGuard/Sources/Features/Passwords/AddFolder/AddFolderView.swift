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
                    Text("Name")
                    
                    Spacer()
                    
                    TextField("None", text: Binding(get: { store.name }, set: { text in store.send(.changeName(text)) }))
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
