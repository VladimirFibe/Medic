import SwiftUI

final class MainViewModel: ObservableObject {
    let category = ["Популярные", "Covid", "Комплексные", "Комплексные2", "Комплексные3", "Комплексные4"]
    @Published var search = ""
    @Published var selectedCatalog = "Популярные"
    @Published var catalog: [Catalog] = []
    func loadCatalog() async {
        do {
            let result = try await MedicHTTPClient.shared.catalog()
            DispatchQueue.main.async {
                self.catalog = result
                
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
