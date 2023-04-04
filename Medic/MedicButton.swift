import SwiftUI

struct MedicButton: View {
    let title: String
    var disabled = false
    let action: () -> ()
    var body: some View {
        Button(action: action) {
            Text(title)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .cornerRadius(10)
                .foregroundColor(.white)
                .opacity(disabled ? 0.5 : 1)
        }
        .disabled(disabled)
    }
}
