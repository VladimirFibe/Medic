import SwiftUI

struct CreatePasswordView: View {
    let columns = Array(repeating: GridItem(.fixed(80), spacing: 24), count: 3)
    let digit = ["1", "2", "3", "4", "5", "6", "7", "8", "9", " ", "0", "  "]
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            LazyVGrid(columns: columns, spacing: 24) {
                ForEach(digit, id: \.self) { value in
                    Text(String(value))
                        .frame(width: 80, height: 80)
                        .background(background(value))
                        .clipShape(Circle())
                }
            }
            .overlay(
                Image("DelIcon")
                .offset(x: 104, y: -30)
                , alignment: .bottom)
        }
    }
    

    func background(_ key: String) -> Color {
        switch key {
        case " ", "  ": return .clear
        default: return .inputBackground
        }
    }
}

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
    }
}
