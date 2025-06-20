//
//  Modifiers.swift
//  MyGuard
//
//  Created by Иван Спирин on 18.06.2025.
//

import SwiftUI

// Apply glass effect
extension View {
    @ViewBuilder
    func applyGlassIfAvailable(in shape: some Shape = .capsule, isEnabled: Bool = true) -> some View {
        if #available(iOS 26, *) {
            self.glassEffect(.regular, in: shape, isEnabled: isEnabled)
        } else {
            self
        }
    }
}

// Glass effect for TextField or background
extension View {
    @ViewBuilder
    func glassEffectTextField(_ style: some ShapeStyle, in shape: some InsettableShape) -> some View {
        if #available(iOS 26, *) {
            self.glassEffect()
        } else {
            self.background(style, in: shape)
        }
    }
}
