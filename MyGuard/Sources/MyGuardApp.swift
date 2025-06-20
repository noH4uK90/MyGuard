import SwiftUI
import NeedleFoundation
import UIKit

@main
struct MyGuardApp: App {
    
    init() {
        registerProviderFactories()
    }
    
    var body: some Scene {
        WindowGroup {
            RootComponent().rootView
        }
    }
}
