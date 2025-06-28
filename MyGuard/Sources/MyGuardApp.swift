import SwiftUI
import NeedleFoundation
import UIKit

@main
struct MyGuardApp: App {
    
    init() {
        registerProviderFactories()
        AppConfig.shared.setupToken()
    }
    
    var body: some Scene {
        WindowGroup {
            RootComponent().rootView
        }
    }
}
