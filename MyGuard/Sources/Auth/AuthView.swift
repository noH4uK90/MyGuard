//
//  AuthView.swift
//  MyGuard
//
//  Created by Иван Спирин on 18.06.2025.
//

import SwiftUI

struct AuthView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
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
            TextField(text: $email, label: { Text("Email") })
            
            TextField(text: $password, label: { Text("Password") })
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .glassEffectTextField(.windowBackground
            .shadow(.drop(color: .primary.opacity(0.45), radius: 2)),
                        in: .rect(cornerRadius: 20))
    }
    
    @ViewBuilder
    var buttons: some View {
        Button {
            
        } label: {
            Text("Forget password?")
                .fontWeight(.bold)
        }
        
        Spacer().frame(height: 30)
        
        Button {
            
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

#Preview {
    AuthView()
        .environment(\.locale, Locale(identifier: "RU"))
}
