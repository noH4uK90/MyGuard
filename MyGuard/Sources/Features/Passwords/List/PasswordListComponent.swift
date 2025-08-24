//
//  PasswordListComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 26.06.2025.
//

import NeedleFoundation
import SwiftUI
import UDFKit

@MainActor
final class PasswordListComponent: Component<PasswordListDependency>, ViewsBuilder {
    
    var store: StoreOf<PasswordListReducer> {
        let safeDependency = ThreadSafe(dependency!)
        return Store(state: PasswordListReducer.State(), reducer: PasswordListReducer(dependency: safeDependency))
    }
    
    var view: some View {
        PasswordListView(store: store, detailBuilder: detailPasswordComponent, addPBuilder: addPasswordComponent, addFBuilder: addFolderComponent)
    }
    
    var detailPasswordComponent: PasswordDetailComponent {
        PasswordDetailComponent(parent: self)
    }
    
    var addPasswordComponent: AddPasswordComponent {
        AddPasswordComponent(parent: self)
    }
    
    var addFolderComponent: AddFolderComponent {
        AddFolderComponent(parent: self)
    }
}
