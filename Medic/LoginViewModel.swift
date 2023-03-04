import SwiftUI

final class LoginViewModel: ObservableObject {
    @AppStorage("token") var token = ""
    @Published var registred = false
    @Published var login = false
    @Published var email = ""
    @Published var code = ""
    @MainActor
    func sendEmail() async throws {
        do {
            try await MedicHTTPClient.shared.sendCode(email: email)
            self.registred = true
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @MainActor
    func signin() async throws {
        do {
            self.token = try await MedicHTTPClient.shared.signin(email: email, code: code)
        } catch {
            print(error.localizedDescription)
        }
    }
}
