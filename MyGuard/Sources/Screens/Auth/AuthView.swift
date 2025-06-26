//
//  AuthView.swift
//  MyGuard
//
//  Created by Иван Спирин on 18.06.2025.
//

import SwiftUI

struct AuthView<Builder: ViewsBuilder>: View {
    
    @ObservedObject var viewModel: AuthViewModel
    var recoveryPasswordBuilder: Builder
    
    @FocusState private var isEmailFocused: Bool
    @FocusState private var isPasswordFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Authorization")
                .font(.largeTitle.bold())
            
            Spacer().frame(height: 70)
            
            inputs
            
            buttons
        }
        .safeAreaPadding(15)
        .applyGlassIfAvailable(in: .rect(cornerRadius: 15))
    }
    
    @ViewBuilder
    var inputs: some View {
        Group {
            HStack {
                Image(systemName: "envelope")
                    .fontWeight(.semibold)
                    .foregroundStyle(isEmailFocused ? Color.accentColor : .secondary)
                    .frame(width: 20)
                    .animation(.easeInOut(duration: 0.15), value: isEmailFocused)
                TextField(text: $viewModel.email, label: { Text("Email") })
                    .focused($isEmailFocused)
            }
            
            HStack {
                Image(systemName: "lock")
                    .fontWeight(.semibold)
                    .foregroundStyle(isPasswordFocused ? Color.accentColor : .secondary)
                    .frame(width: 20)
                    .animation(.easeInOut(duration: 0.15), value: isPasswordFocused)
                    
                TextField(text: $viewModel.password, label: { Text("Password") })
                    .focused($isPasswordFocused)
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .glassEffectTextField(.quinary
            .shadow(.drop(color: .primary.opacity(0.45), radius: 2)),
                        in: .rect(cornerRadius: 20))
    }
    
    @ViewBuilder
    var buttons: some View {
        NavigationLink(
            destination: recoveryPasswordBuilder.view,
            label: {
                Text("Forget password?")
                    .fontWeight(.bold)
            })
        
        Spacer().frame(height: 30)
        
        Button {
            viewModel.login()
        } label: {
            Text("Login")
                .contentTransition(.numericText())
                .foregroundStyle(.white)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .background(.blue.gradient, in: .capsule)
        }
    }
}

//#Preview {
//    AuthView()
//        .environment(\.locale, Locale(identifier: "RU"))
//}
