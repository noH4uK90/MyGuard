//
//  PasswordListView.swift
//  MyGuard
//
//  Created by Иван Спирин on 26.06.2025.
//

import SwiftUI
import UDFKit

struct PasswordListView<DetailBuilder: PasswordDetailBuilder, AddPBuilder: AddPasswordBuilder, AddFBuilder: AddFolderBuilder>: View {
        
    @ObservedObject var store: StoreOf<PasswordListReducer>
    
    var detailBuilder: DetailBuilder
    var addPBuilder: AddPBuilder
    var addFBuilder: AddFBuilder
    
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
                NavigationLink(destination: detailBuilder.view(Int(folder.id)!).toolbar(.hidden, for: .tabBar), label: {
                    HStack {
                        Image(systemName: "key.fill")
                            .foregroundStyle(.placeholder)
                        Text(folder.name)
                    }
                })
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
        NavigationLink(destination: {
            addFBuilder.view(folderId)
                .toolbar(.hidden, for: .tabBar)
        }, label: { Label("Add folder", systemImage: "folder.badge.plus") })
        
        NavigationLink(destination: {
            addPBuilder.view(folderId)
                .toolbar(.hidden, for: .tabBar)
        }, label: { Label("Add password", systemImage: "key") })
    }
    
    
    func deleteButton(_ folder: Folder) -> some View {
        Button(role: .destructive, action: { store.send(.delete(folder)) }) {
            Label("Delete", systemImage: "trash")
        }
    }
}
