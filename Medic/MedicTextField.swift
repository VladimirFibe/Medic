import SwiftUI

struct MedicTextField: View {
    let title: String
    @Binding var text: String
    var body: some View {
        let roundRect = RoundedRectangle(cornerRadius: 10, style: .continuous)
        TextField(title, text: $text)
            .frame(height: 48)
            .padding(.leading)
            .background(roundRect.fill(Color.inputBackground))
            .overlay(roundRect.stroke(Color.inputStroke, lineWidth: 1))
    }
}

struct MedicTextField_Previews: PreviewProvider {
    static var previews: some View {
        MedicTextField(title: "Имя", text: .constant(""))
            .padding()
    }
}
