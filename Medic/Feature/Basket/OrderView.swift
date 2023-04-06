import SwiftUI

struct OrderView: View {
    @ObservedObject var viewModel: MainViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(viewModel: MainViewModel())
    }
}
