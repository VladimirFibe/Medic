import SwiftUI

struct ContentView: View {
    @AppStorage("token") var token = ""
    @AppStorage("onboarding") var onboarding = true
    @EnvironmentObject var viewModel: LoginViewModel
    @State private var catalog: [Catalog] = []
    @State private var news: [News] = []
    var body: some View {
        if onboarding {
            OnboardingView()
        } else if token.isEmpty {
            if viewModel.registred {
                CodeView()
            } else {
                EmailView()
            }
        } else {
            CardView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LoginViewModel())
    }
}
