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
    public func applyGlassIfAvailable(in shape: some Shape = .capsule, isEnabled: Bool = true) -> some View {
        if #available(iOS 26, *) {
            self.glassEffect(.regular, in: shape)
        } else {
            self
        }
    }
}

// MARK: Glass effect for TextField or background
extension View {
    @ViewBuilder
    public func glassEffectTextField(_ style: some ShapeStyle, in shape: some InsettableShape) -> some View {
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
    public func showTabBar(show: @escaping () -> Void, hide: @escaping () -> Void) -> some View {
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
    public func hideTabBar(show: @escaping () -> Void, hide: @escaping () -> Void) -> some View {
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
    public func showingTabBar(showingTabBar: Binding<Bool>) -> some View {
        self.modifier(ShowingTabBarModifier(showingTabBar: showingTabBar))
    }
}

// MARK: Hidden View
extension View {
    @ViewBuilder
    public func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}

// MARK: Disable back swipe
struct DisableSwipeBackView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = DisableSwipeBackViewController
    
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        UIViewControllerType()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

class DisableSwipeBackViewController: UIViewController {
    
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        if let parent = parent?.parent,
           let navigationController = parent.navigationController,
           let interactivePopGestureRecognizer = navigationController.interactivePopGestureRecognizer {
            navigationController.view.removeGestureRecognizer(interactivePopGestureRecognizer)
        }
    }
}

extension View {
    public func disableSwipeBack() -> some View {
        self.background(DisableSwipeBackView())
    }
}

// MARK: - Shake effect
struct ShakeEffect: GeometryEffect {
    var travelDistance: CGFloat = 6
    var shakePerUnit = 3
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX: travelDistance * sin(animatableData * .pi * CGFloat(shakePerUnit)), y: 0))
    }
}

extension View {
    public func shakeEffect(travelDistance: CGFloat = 6, shakePerUnit: Int = 3, animatableData: CGFloat) -> some View {
        self.modifier(ShakeEffect(travelDistance: travelDistance, shakePerUnit: shakePerUnit, animatableData: animatableData))
    }
}
