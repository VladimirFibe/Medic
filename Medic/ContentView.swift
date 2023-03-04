import SwiftUI

struct ContentView: View {
    @AppStorage("token") var token = ""
    @EnvironmentObject var viewModel: LoginViewModel
    @State private var catalog: [Catalog] = []
    @State private var news: [News] = []
    var body: some View {
        if token.isEmpty {
            if viewModel.registred {
                CodeView()
            } else {
                EmailView()
            }
        } else {
            List(news) {
                Text($0.name)
            }
            .task {
                do {
                    news = try await MedicHTTPClient.shared.news()
                } catch {}
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LoginViewModel())
    }
}
