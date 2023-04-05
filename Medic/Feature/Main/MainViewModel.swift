import SwiftUI

final class MainViewModel: ObservableObject {
    let category = ["Популярные", "Covid", "Комплексные", "Комплексные2", "Комплексные3", "Комплексные4"]
    @Published var search = ""
    @Published var selectedCatalog = "Популярные"
    @Published var catalog: [Catalog] = []
    @Published var news: [News] = []
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
    func loadNews() async {
        do {
            let result = try await MedicHTTPClient.shared.news()
            DispatchQueue.main.async {
                
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
