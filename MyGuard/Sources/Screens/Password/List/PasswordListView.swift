//
//  PasswordListView.swift
//  MyGuard
//
//  Created by Иван Спирин on 26.06.2025.
//

import SwiftUI

struct PasswordListView: View {
    
    let passwordItems: [PasswordItem] = [
        PasswordItem(name: "Бухгалтерия", children: [
            PasswordItem(name: "Wi-Fi", children: [
                PasswordItem(name: "wi-Fi", children: nil)
            ]),
            PasswordItem(name: "Электронная почта", children: [
                PasswordItem(name: "Почта майл", children: nil)
            ])
        ]),
        PasswordItem(name: "Внутренние сервисы", children: [
            PasswordItem(name: "Битрикс24", children: [
                PasswordItem(name: "stepanovme", children: nil),
                PasswordItem(name: "ev.stepanovsky@st29.ru", children: nil),
                PasswordItem(name: "st29com@mail.ru", children: nil),
                PasswordItem(name: "galina.trofimchuck@yandex.ru", children: nil),
            ]),
            PasswordItem(name: "Почта", children: []),
            PasswordItem(name: "Сайт", children: []),
            PasswordItem(name: "Облако", children: [])
        ]),
        PasswordItem(name: "Wi-Fi", children: [
            PasswordItem(name: "Wi-Fi бухгалтерия", children: nil),
            PasswordItem(name: "Wi-Fi Снабжение", children: nil)
        ]),
        PasswordItem(name: "TestPassword", children: nil)
    ]
    
    var body: some View {
        List {
            ForEach(passwordItems, id: \.id) { item in
                Section{
                    if item.children == nil {
                        folder(item: item)
                    } else {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            OutlineGroup(item.children ?? [], children: \.children) { child in
                                folder(item: child)
                                    .contextMenu {
                                        if child.children != nil {
                                            addButtons
                                            
                                            Divider()
                                        }
                                        
                                        deleteButton
                                    }
                            }
                        }
                    }
                } header: {
                    HStack {
                        Text(item.name)
                        Spacer()
                        Menu {
                            addButtons
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
    }
    
    func folder(item: PasswordItem) -> some View {
        HStack {
            Image(systemName: item.children == nil ? "key.fill" : "folder.fill")
                .foregroundStyle(.placeholder)
            Text(item.name)
        }
    }
    
    @ViewBuilder
    var addButtons: some View {
        Button {
            
        } label: {
            Label("Add folder", systemImage: "folder.badge.plus")
        }
        
        Button {
            
        } label: {
            Label("Add password", systemImage: "key")
        }
    }
    
    @ViewBuilder
    var deleteButton: some View {
        Button(role: .destructive, action: {  }) {
            Label("Delete", systemImage: "trash")
        }
    }
}

struct PasswordItem: Identifiable {
    let id: UUID = UUID()
    let name: String
    let children: [PasswordItem]?
}

#Preview {
    PasswordListView()
}
