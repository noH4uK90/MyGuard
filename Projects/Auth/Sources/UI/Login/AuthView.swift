//
//  AuthView.swift
//  MyGuard
//
//  Created by Иван Спирин on 18.06.2025.
//

import SwiftUI
import UDFKit
import Core

struct AuthView: View {
    
    @ObservedObject var store: StoreOf<AuthReducer>
    
    @FocusState private var isEmailFocused: Bool
    @FocusState private var isPasswordFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("authorizationTitle")
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
                TextField(text: Binding(get: { store.email }, set: { text, _ in store.send(.textChange(\.email, text)) }), label: { Text("emailTextFieldPlaceholder") })
                    .focused($isEmailFocused)
            }
            
            HStack {
                Image(systemName: "lock")
                    .fontWeight(.semibold)
                    .foregroundStyle(isPasswordFocused ? Color.accentColor : .secondary)
                    .frame(width: 20)
                    .animation(.easeInOut(duration: 0.15), value: isPasswordFocused)
                    
                TextField(text: Binding(get: { store.password }, set: { text, _ in store.send(.textChange(\.password, text)) }), label: { Text("passwordTextFieldPlaceholder") })
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
        Button {
            store.send(.openRecoveryPassword)
        } label: {
            Text("forgetPasswordButtonTitle")
                .fontWeight(.bold)
        }
        
        Spacer().frame(height: 30)
        
        Button {
            store.send(.loginOnTap)
        } label: {
            Text("loginButtonTitle")
                .contentTransition(.numericText())
                .foregroundStyle(.white)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .background(.blue.gradient, in: .capsule)
        }
    }
}
