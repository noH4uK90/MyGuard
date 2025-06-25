//
//  Modifiers.swift
//  MyGuard
//
//  Created by Иван Спирин on 18.06.2025.
//

import SwiftUI

// MARK: Apply glass effect
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

// MARK: Glass effect for TextField or background
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

// MARK: Show tab bar modifier
struct ShowTabBarModifier: ViewModifier {
    
    var show: () -> Void
    var hide: () -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear { show() }
            .onDisappear { hide() }
    }
}

extension View {
    func showTabBar(show: @escaping () -> Void, hide: @escaping () -> Void) -> some View {
        self.modifier(ShowTabBarModifier(show: show, hide: hide))
    }
}

// MARK: Hide tab bar modifier
struct HideTabBarModifier: ViewModifier {
    
    var show: () -> Void
    var hide: () -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear { hide() }
            .onDisappear { show() }
    }
}

extension View {
    func hideTabBar(show: @escaping () -> Void, hide: @escaping () -> Void) -> some View {
        self.modifier(HideTabBarModifier(show: show, hide: hide))
    }
}

// MARK: Showing tab bar modifier
struct ShowingTabBarModifier: ViewModifier {
    @Binding var showingTabBar: Bool
    
    func body(content: Content) -> some View {
        if showingTabBar {
            content.hidden()
        } else {
            content
        }
    }}

extension View {
    func showingTabBar(showingTabBar: Binding<Bool>) -> some View {
        self.modifier(ShowingTabBarModifier(showingTabBar: showingTabBar))
    }
}

// MARK: Hidden View
extension View {
    @ViewBuilder
    func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
