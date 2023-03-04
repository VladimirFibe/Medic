import SwiftUI

struct MedicButton: View {
    let title: String
    let action: () -> ()
    var body: some View {
        Button(action: action) {
            Text(title)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .cornerRadius(10)
                .foregroundColor(.white)
        }
    }
}

struct MedicButton_Previews: PreviewProvider {
    static var previews: some View {
        MedicButton(title: "Поехали", action: {})
            .padding()
    }
}
