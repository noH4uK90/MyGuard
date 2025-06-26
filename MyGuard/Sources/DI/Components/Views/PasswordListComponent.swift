//
//  PasswordListComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 26.06.2025.
//

import NeedleFoundation
import SwiftUI

final class PasswordListComponent: Component<PasswordListDependency>, ViewsBuilder {
    
    var viewModel: PasswordListViewModel {
        PasswordListViewModel()
    }
    
    var view: some View {
        PasswordListView()
    }
}
