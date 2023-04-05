import Foundation

struct Basket: Identifiable {
    var id: Int {
        catalog.id
    }
    let catalog: Catalog
    var count = 1
}
