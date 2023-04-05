import SwiftUI

struct MedicTextField: View {
    let title: String
    var icon = ""
    @Binding var text: String
    var body: some View {
        let roundRect = RoundedRectangle(cornerRadius: 10, style: .continuous)
        TextField(title, text: $text)
            .frame(height: 48)
            .padding(.leading, icon.isEmpty ? 16 : 42)
            .background(roundRect.fill(Color.inputBackground))
            .overlay(roundRect.stroke(Color.inputStroke, lineWidth: 1))
            .overlay(iconView.padding(.leading, 8), alignment: .leading)
    }
    var iconView: some View {
        VStack {
            if icon.isEmpty {
                EmptyView()
            } else {
                Image(systemName: icon)
            }
        }
    }
}

struct MedicTextField_Previews: PreviewProvider {
    static var previews: some View {
        MedicTextField(title: "Имя", text: .constant(""))
            .padding()
    }
}
