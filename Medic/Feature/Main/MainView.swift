import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainViewModel()
    var body: some View {
        List {
            VStack(alignment: .leading, spacing: 10) {
                
                MedicTextField(title: "Искать анализы", icon: "magnifyingglass", text: $viewModel.search)
                    .padding(.bottom, 22)
                Text("Акции и новости")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.medicGray)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0 ..< 5) { item in
                            Image("Banner")
                        }
                    }
                }
                .padding(.bottom, 22)
                Text("Каталог анализов")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.medicGray)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.category, id: \.self) { title in
                            Text(title)
                                .font(.system(size: 15, weight: .medium))
                                .padding(.vertical, 10)
                                .padding(.horizontal)
                                .foregroundColor(viewModel.selectedCatalog == title ? .white : .medicGray)
                                .background(RoundedRectangle(cornerRadius: 10)
                                    .fill(viewModel.selectedCatalog == title ? Color.accentColor : Color.inputBackground))
                                .onTapGesture {
                                    viewModel.selectedCatalog = title
                                }
                            
                        }
                    }
                }
            }
            ForEach(viewModel.catalog) { item in
                CatalogItem(item: item)
            }
        }
        .listRowSeparator(.hidden)
        .listStyle(.plain)
        .task {
            await viewModel.loadCatalog()
            await viewModel.loadNews()
        }
    }
}

struct CatalogItem: View {
    let item: Catalog
    var body: some View {
        let roundRect = RoundedRectangle(cornerRadius: 12, style: .continuous)
        VStack(alignment: .leading) {
            Text(item.name)
                .font(.system(size: 16, weight: .medium))
            HStack {
                VStack(alignment: .leading) {
                    Text(item.time_result)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.medicGray)
                    Text(item.price)
                        .font(.system(size: 17, weight: .semibold))
                }
                Spacer()
                Button {
                    
                } label: {
                    Text("Добавить")
                        .font(.system(size: 14, weight: .semibold))
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color.accentColor))
                }

            }
        }
        .padding(10)
        .background(roundRect.fill(Color.white))
        .overlay(roundRect.stroke(Color.inputStroke, lineWidth: 1))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
