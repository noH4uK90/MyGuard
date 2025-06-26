//
//  RecoveryPasswordComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 21.06.2025.
//

import NeedleFoundation
import SwiftUI

final class RecoveryPasswordComponent: Component<RecoveryPasswordDependency>, ViewsBuilder {
    
    typealias ViewModel = RecoveryPasswordViewModel
    
    var viewModel: ViewModel {
        RecoveryPasswordViewModel()
    }
    
    var view: some View {
        RecoveryPasswordView()
    }
}

protocol RecoveryPasswordBuilder {
    associatedtype ContentView: View
    
    var view: ContentView { get }
}
