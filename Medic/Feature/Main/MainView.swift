import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainViewModel()
    var body: some View {
        VStack(alignment: .leading) {
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
                        ForEach(viewModel.catalog, id: \.self) { title in
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
            .padding(.horizontal)
            List {
                ForEach(0 ..< 5) { item in
                    CatalogItem()
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            
            
        }
    }
}

struct CatalogItem: View {
    var body: some View {
        let roundRect = RoundedRectangle(cornerRadius: 12, style: .continuous)
        VStack(alignment: .leading) {
            Text("ПЦР-тест на определение РНК короновируса стандартный")
                .font(.system(size: 16, weight: .medium))
            HStack {
                VStack(alignment: .leading) {
                    Text("2 дня")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.medicGray)
                    Text("1800 ₽")
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
