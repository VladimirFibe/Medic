import Foundation

final class CardViewModel: ObservableObject {
    @Published var lastname = ""
    @Published var firstname = ""
    @Published var midlename = ""
    @Published var birthday = "2000-01-01"
    @Published var sex = "Мужской"
    
    func send() {
        Task {
            do {
                try await MedicHTTPClient.shared.createProfile(card: Card(id: 1, firstname: firstname, lastname: lastname, middlename: midlename, bith: birthday, pol: sex, image: ""))
            } catch {}
        }
    }
}
