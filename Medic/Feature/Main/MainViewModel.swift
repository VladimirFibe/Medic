import SwiftUI

final class MainViewModel: ObservableObject {
    let category = ["Популярные", "Covid", "Комплексные", "Комплексные2", "Комплексные3", "Комплексные4"]
    @Published var search = ""
    @Published var selectedCatalog = "Популярные"
    @Published var catalog: [Catalog] = []
    @Published var basket: [Basket] = []
    @Published var news: [News] = []
    @Published var added: Set<Int> = []

    var sum: String {
        let sum = basket.reduce(0, {$0 + ($1.price * $1.count)})
        return String(sum)
    }
    
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
                self.news = result
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func addCatalog(_ catalog: Catalog) {
        if let index = basket.firstIndex(where: { $0.id == catalog.id}) {
            basket.remove(at: index)
            added.remove(catalog.id)
        } else {
            basket.append(Basket(catalog: catalog))
            added.insert(catalog.id)
        }
    }
    
    func remove(_ index: Int) -> Bool {
        added.contains(index)
    }
}
