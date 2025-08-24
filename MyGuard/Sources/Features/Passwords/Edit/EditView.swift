//
//  EditPasswordView.swift
//  MyGuard
//
//  Created by Иван Спирин on 30.06.2025.
//

import SwiftUI

struct EditPasswordView: View {
    
    var draft: PasswordDetail
    var draftChange: ((WritableKeyPath<PasswordDetail, String>, String) -> Task<Void, Never>?)
    var delete: (() -> Void)? = nil
    
    var body: some View {
        // Title Section
        Section {
            TextField("Name", text: Binding(get: { draft.name }, set: { text,_ in _ = draftChange(\.name, text) }))
            
            HStack {
                Text("Login")
                    .font(.headline)
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                TextField("None", text: Binding(get: { draft.login }, set: { text,_ in _ = draftChange(\.login, text) }))
                    .monospaced()
                    .frame(maxWidth: 200)
                    .multilineTextAlignment(.trailing)
            }
        }
        
        // Password Section
        Section {
            HStack {
                Text("Password")
                    .font(.headline)
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                TextField("None", text: Binding(get: { draft.password }, set: { text,_ in _ = draftChange(\.password, text) }))
                    .monospaced()
                    .frame(maxWidth: 200)
                    .multilineTextAlignment(.trailing)
            }
            
            Button("Generate password") {
                _ = draftChange(\.password, generatePassword())
            }
        }
        
        // Note Section
        Section {
            HStack {
                Text("Website")
                    .font(.headline)
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                TextField("None", text: Binding(get: { draft.url }, set: { text,_ in _ = draftChange(\.url, text) }))
                    .monospaced()
                    .frame(maxWidth: 200)
                    .multilineTextAlignment(.trailing)
            }
            
            TextField("Note", text: Binding(get: { draft.note }, set: { text,_ in _ = draftChange(\.note, text) }), axis: .vertical)
        }
        
        // Delete Section
        if let delete {
            Section {
                Button("Delete", role: .destructive) { delete() }
            }
        }
    }
    
    private func generatePassword() -> String {
        var result = ""
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        for i in 0..<14 {
            if i == 4 || i == 9 {
                result.append("-")
            } else {
                result.append(characters.randomElement()!)
            }
        }
        
        return result
    }
}
