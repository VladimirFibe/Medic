import SwiftUI

struct BasketView: View {
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        VStack {
            HStack {
                Text("Корзина")
                Spacer()
                Button {
                    viewModel.basket.removeAll()
                    viewModel.added.removeAll()
                } label: {
                    Image(systemName: "trash")
                }

            }
            List {
                ForEach(viewModel.basket.indices, id: \.self) { index in
                    let item = viewModel.basket[index]
                    VStack {
                        HStack {
                            Text(item.catalog.name)
                            Spacer()
                            Image(systemName: "xmark")
                        }
                        Spacer()
                        HStack {
                            Text("\(item.price * item.count)")
                            Spacer()
                            Stepper(value: $viewModel.basket[index].count, in: 1...9) {
                                Text("\(viewModel.basket[index].count) пациент")
                            }
                            .frame(width: 200)
                        }
                        
                    }
                    .padding(8)
                    .frame(height: 138)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 1)
                }
                
                HStack {
                    Spacer()
                    Text(viewModel.sum)
                }
            }
            .listStyle(.plain)
            .listRowSeparator(.hidden)
            
        }
        .padding()
    }
}

struct BasketItem: View {
    @State private var step = 1
    var item: Basket
    var body: some View {
        VStack {
            HStack {
                Text("Клинический анализ крови с лейкоцитарной формулировкой")
                Spacer()
                Image(systemName: "xmark")
            }
            Spacer()
            HStack {
                Text("690 ₽")
                Spacer()
                Stepper(value: $step, in: 1...9) {
                    Text("\(step) пациент")
                }
                .frame(width: 200)
            }
            
        }
        .padding(8)
        .frame(height: 138)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
    }
}
struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView(viewModel: MainViewModel())
    }
}
