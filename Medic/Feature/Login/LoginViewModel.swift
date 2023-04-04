import SwiftUI

final class LoginViewModel: ObservableObject {
    @AppStorage("token") var token = ""
    @Published var registred = false
    @Published var login = false
    @Published var email = "motiw@icloud.com"
    @Published var code = ""
    
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
    }
    
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
    
    func submitPin() {
        if code.count == 4 {
            Task {
                try await signin()
            }
        }
        if code.count > 4 {
            code = String(code.prefix(4))
            submitPin()
        }
    }
    
    func getImageName(at index: Int) -> String {
        index >= code.count ? "" : code.digits[index].numberString
    }
}
