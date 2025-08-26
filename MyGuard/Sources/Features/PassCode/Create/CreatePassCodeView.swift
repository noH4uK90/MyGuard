//
//  CreatePassCodeView.swift
//  MyGuard
//
//  Created by Иван Спирин on 07.07.2025.
//

import SwiftUI
import UDFKit

struct CreatePassCodeView: View {
    
    @ObservedObject var store: StoreOf<CreatePassCodeReducer>
    
    @State private var shakeAttempts: Int = 0
    
    @State private var showConfirmation: Bool = false
    @State private var showSaveButton: Bool = false
    @State private var showErrorGlow: Bool = false
    
    @FocusState private var selectedField: Field?
    
    var body: some View {
        VStack(alignment: .center) {
            
            Text("createPassCodeTitle")
                .font(.title3.weight(.semibold))
                .padding(.bottom, 1)

            Text("passCodeDescription")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .padding(.bottom, 25)
            
            
            Text("inputPassCodeTitle")
                .font(.callout)
            SecureField("", text: Binding(get: { store.passCode }, set: { text, _ in store.send(.changePassCode(\.passCode, text)) }))
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .font(.system(size: 23, weight: .medium))
                .monospaced()
                
                .frame(maxWidth: 170)
                .padding(.vertical, 5)
                .padding(.horizontal, 7)
                .glassEffectTextField(.quinary
                    .shadow(.drop(color: .primary.opacity(0.45), radius: 2)),
                                in: .rect(cornerRadius: 20))
            
                .focused($selectedField, equals: .passCode)
                .onChange(of: store.passCode) { _, newValue in
                    store.send(.filterPassCode(\.passCode, newValue))
                    
                    if store.passCode.count == 6 {
                        withAnimation(.easeInOut(duration: 0.45)) {
                            selectedField = .confirm
                            showConfirmation = true
                        }
                    } else {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            store.send(.changePassCode(\.confirmationPassCode, ""))
                            selectedField = .passCode
                            showConfirmation = false
                        }
                    }
                }
            
            if showConfirmation {
                Spacer()
                    .frame(height: 20)
                
                Group {
                    Text("confirmPassCodeTitle")
                        .font(.callout)
                    SecureField("", text: Binding(get: { store.confirmationPassCode }, set: { text, _ in store.send(.changePassCode(\.confirmationPassCode, text)) }))
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .font(.system(size: 23, weight: .medium))
                        .monospaced()
                        
                        .frame(maxWidth: 170)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 7)
                        .glassEffectTextField(.quinary
                            .shadow(.drop(color: .primary.opacity(0.45), radius: 2)),
                                              in: .rect(cornerRadius: 20))
                    
                        .focused($selectedField, equals: .confirm)
                        .onChange(of: store.confirmationPassCode) { _, newValue in
                            store.send(.filterPassCode(\.confirmationPassCode, newValue))
                            if store.confirmationPassCode.count == 6 {
                                if store.confirmationPassCode != store.passCode {
                                    withAnimation {
                                        shakeAttempts += 1
                                        showSaveButton = false
                                        showErrorGlow = true
                                    }
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6, execute: {
                                        withAnimation(.easeOut(duration: 0.3)) {
                                            showErrorGlow = false
                                        }
                                    })
                                } else {
                                    withAnimation {
                                        selectedField = nil
                                        showSaveButton = true
                                    }
                                }
                            }
                        }
                        .shakeEffect(animatableData: CGFloat(shakeAttempts))
                        .shadow(color: showErrorGlow ? Color.red.opacity(0.4) : .clear,
                                radius: showErrorGlow ? 6 : 0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(showErrorGlow ? Color.red.opacity(0.3) : .clear, lineWidth: 2)
                                .blur(radius: 0.5)
                        )
                }
                .transition(.move(edge: .top).combined(with: .opacity))
            }
            
            if showSaveButton {
                Spacer()
                    .frame(height: 20)
                Button {
                    store.send(.save)
                } label: {
                    Text("saveButtonTitle")
                        .contentTransition(.numericText())
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .frame(width: 250)
                        .padding(.horizontal, 3)
                        .padding(.vertical, 10)
                        .background(.blue.gradient, in: .capsule)
                }
                .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
        .padding(.vertical, 25)
        .padding(.horizontal, 35)
        .applyGlassIfAvailable(in: .rect(cornerRadius: 15))
    }
    
    enum Field: Hashable {
        case passCode
        case confirm
    }
}
