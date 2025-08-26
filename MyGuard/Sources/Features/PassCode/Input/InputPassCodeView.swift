//
//  InputPassCodeView.swift
//  MyGuard
//
//  Created by Иван Спирин on 06.07.2025.
//

import SwiftUI
import UDFKit

struct InputPassCodeView: View {

    @ObservedObject var store: StoreOf<InputPassCodeReducer>

    private let buttonSize: CGFloat = 70
    private let gridSpacing: CGFloat = 20
    private let circleSpacing: CGFloat = 16

    private var columns: [GridItem] {
        Array(
            repeating: GridItem(.fixed(buttonSize), spacing: gridSpacing),
            count: 3
        )
    }

    var body: some View {
        ZStack {
            Color.clear.background(.ultraThickMaterial)

            VStack(spacing: 40) {

                Spacer()

                VStack {
                    Text("inputPassCodeTitle")
                        .font(.title2)

                    HStack(alignment: .center) {
                        ForEach(0..<store.maxDigits, id: \.self) { index in
                            Circle()
                                .foregroundStyle(
                                    store.isError
                                    ? Color.red.opacity(0.5).gradient
                                        : store.passCode.count <= index
                                            ? Color.accentColor.opacity(0.3)
                                                .gradient
                                            : Color.accentColor.gradient
                                )
                                .frame(
                                    width: store.passCode.count <= index
                                        ? 15 : 19,
                                    height: store.passCode.count <= index
                                        ? 15 : 19
                                )
                        }
                    }
                    .shakeEffect(animatableData: CGFloat(store.shakeAttempts))
                    .frame(minWidth: 200, minHeight: 19)
                }
                .padding(.top)

                Spacer()

                LazyVGrid(columns: columns) {
                    ForEach(1...9, id: \.self) { id in
                        digitButton(id)
                    }

                    faceIdButton

                    digitButton(0)

                    deleteButton
                }
                .frame(maxWidth: 300)
            }
            .padding(20)
        }
        .onAppear {
            store.send(.enterWithBiometry)
        }
    }

    private func digitButton(_ digit: Int) -> some View {
        Button {
            withAnimation {
                _ = store.send(.insert(digit))
            }
        } label: {
            Text("\(digit)")
                .font(.largeTitle.bold())
                .frame(width: buttonSize, height: buttonSize)
                .foregroundStyle(Color.accentColor.gradient)
        }
    }

    private var faceIdButton: some View {
        Button {
            store.send(.enterWithBiometry)
        } label: {
            Text("logoutButtonTitle")
                .font(.system(size: 19, weight: .regular))
                .foregroundStyle(Color.accentColor.gradient)
                .frame(width: buttonSize, height: buttonSize)
        }
    }

    private var deleteButton: some View {
        Button {
            withAnimation {
                _ = store.send(.delete)
            }
        } label: {
            if store.passCode.isEmpty {
                Image(
                    systemName: store.biometryType == .faceID
                        ? "faceid" : "touchid"
                )
                .resizable()
                .frame(width: 35, height: 35)
            } else {
                Image(systemName: "delete.backward")
                    .resizable()
                    .frame(width: 35, height: 29)
            }
        }
        .foregroundStyle(Color.accentColor.gradient)
        .animation(.bouncy, value: store.passCode)
    }
}
