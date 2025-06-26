//
//  ProfileComponent.swift
//  MyGuard
//
//  Created by Иван Спирин on 26.06.2025.
//

import NeedleFoundation
import SwiftUI

final class ProfileComponent: Component<ProfileDependency>, ViewsBuilder {
    
    var viewModel: ProfileViewModel {
        ProfileViewModel()
    }
    
    var view: some View {
        ProfileView()
    }
}

protocol ProfileBuilder {
    associatedtype ContentType: View
    
    var view: ContentType { get }
}
