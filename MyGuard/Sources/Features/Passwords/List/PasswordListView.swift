//
//  PasswordListView.swift
//  MyGuard
//
//  Created by Иван Спирин on 26.06.2025.
//

import SwiftUI
import UDFKit

struct PasswordListView: View {
        
    @ObservedObject var store: StoreOf<PasswordListReducer>
    
    var body: some View {
        List {
            ForEach(store.folders, id: \.id) { folder in
                Section{
                    if folder.children == nil {
                        folderView(folder)
                    } else {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            OutlineGroup(folder.children ?? [], children: \.children) { child in
                                folderView(child)
                                    .contextMenu {
                                        if child.children != nil {
                                            addButtons(Int(child.id)!)
                                            
                                            Divider()
                                        }
                                        
                                        deleteButton(child)
                                    }
                            }
                        }
                    }
                } header: {
                    HStack {
                        Text(folder.name)
                        Spacer()
                        Menu {
                            addButtons(Int(folder.id)!)
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
        .onAppear {
            store.send(.load)
        }
    }
    
    func folderView(_ folder: Folder) -> some View {
        Group {
            if folder.children == nil {
                HStack {
                    Image(systemName: "key.fill")
                        .foregroundStyle(.placeholder)
                    Text(folder.name)
                }
                .onTapGesture {
                    store.send(.openDetail(Int(folder.id)!))
                }
            } else {
                HStack {
                    Image(systemName: "folder.fill")
                        .foregroundStyle(.placeholder)
                    Text(folder.name)
                }
            }
        }
    }
    
    @ViewBuilder
    func addButtons(_ folderId: Int) -> some View {
        Button {
            store.send(.openAddFolderForm(folderId))
        } label: {
            Label(NSLocalizedString("addFolderButton", comment: "Add folder button"), systemImage: "folder.badge.plus")
        }
        
        Button {
            store.send(.openAddPasswordForm(folderId))
        } label: {
            Label(String(localized: "addPasswordButton"), systemImage: "key")
        }
    }
    
    
    func deleteButton(_ folder: Folder) -> some View {
        Button(role: .destructive, action: { store.send(.delete(folder)) }) {
            Label("deleteButtonTitle", systemImage: "trash")
        }
    }
}
