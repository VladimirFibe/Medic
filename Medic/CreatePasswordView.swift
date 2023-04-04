import SwiftUI

struct CreatePasswordView: View {
    @AppStorage("password") var password = ""
    let columns = Array(repeating: GridItem(.fixed(80), spacing: 24), count: 3)
    let digit = ["1", "2", "3", "4", "5", "6", "7", "8", "9", " ", "0", "  "]
    @State private var keys = ""
    var body: some View {
        VStack(spacing: 30.0) {
            Text("Создайте пароль")
                .font(.system(size: 24, weight: .bold))
            Text("Для защиты ваших персональных данных")
            HStack {
                ForEach(0..<4, id: \.self) { index in
                    Circle()
                        .fill(index < keys.count ? Color.blue : Color.white)
                        .frame(width: 15, height: 15)
                        .overlay(Circle().stroke(Color.blue))
                }
            }
            LazyVGrid(columns: columns, spacing: 24) {
                ForEach(digit, id: \.self) { value in
                    Text(String(value))
                        .frame(width: 80, height: 80)
                        .background(background(value))
                        .clipShape(Circle())
                        .onTapGesture {
                            if !value.contains(" ") {
                                keys += value
                                if keys.count == 4 {
                                    password = keys
                                }
                            }
                        }
                }
            }
            .overlay(
                Button(action: {
                    if !password.isEmpty {
                        password.removeLast()
                    }
                }, label: {
                    Image("DelIcon")
                })
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
