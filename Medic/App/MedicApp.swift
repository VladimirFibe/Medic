import SwiftUI

@main
struct MedicApp: App {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
