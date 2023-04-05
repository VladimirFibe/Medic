import SwiftUI

final class MainViewModel: ObservableObject {
    let catalog = ["Популярные", "Covid", "Комплексные", "Комплексные2", "Комплексные3", "Комплексные4"]
    @Published var search = ""
    @Published var selectedCatalog = "Популярные"
}
