import SwiftUI

struct ContentView: View {
    @AppStorage("token") var token = ""
    @AppStorage("password") var password = ""
    @AppStorage("onboarding") var onboarding = true
    
    @EnvironmentObject var viewModel: LoginViewModel
    @State private var catalog: [Catalog] = []
    @State private var news: [News] = []
    @State private var tab = 0
    var body: some View {
        if onboarding {
            OnboardingView()
        } else if token.isEmpty {
            if viewModel.registred {
                CodeView()
            } else {
                EmailView()
            }
        } else if password.isEmpty {
            CreatePasswordView()
        } else {
            tabBar
        }
    }
    var tabBar: some View {
        TabView(selection: $tab) {
            MainView()
                .tabItem {
                    Image("analiz")
                        .renderingMode(.template)
                    Text("Анализы")
                }
                .tag(0)
            ResultsView().tabItem {
                Image("result")
                    .renderingMode(.template)
                Text("Результаты")
            }.tag(1)
            Text("Support").tabItem {
                Image("support")
                    .renderingMode(.template)
                Text("Поддержка")
            }.tag(2)
            ProfileView().tabItem {
                Image("profile")
                    .renderingMode(.template)
                Text("Профиль")
            }.tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LoginViewModel())
    }
}
