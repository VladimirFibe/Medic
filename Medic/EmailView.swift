import SwiftUI

struct EmailView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    var body: some View {
        VStack {
            Text("Вход по E-mail")
            MedicTextField(title: "example@mail.ru", text: $viewModel.email)
            MedicButton(title: "Далее") {
                Task {
                   try await viewModel.sendEmail()
                }
            }
            .disabled(viewModel.email.isEmpty)

        }
        .padding()
    }
}

struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        EmailView()
            .environmentObject(LoginViewModel())
    }
}
