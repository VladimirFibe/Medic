import SwiftUI

struct EmailView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 5.0) {
            HStack {
                Text("✋")
                Text("Добро пожаловать!")
            }
            .font(.system(size: 24, weight: .bold))
            .padding(.bottom, 24)
            Text("Войдите, чтобы пользоваться функциями приложения")
                .font(.system(size: 15, weight: .regular))
                .padding(.bottom, 64)

            Text("Вход по E-mail")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.medicGray)


            MedicTextField(title: "example@mail.ru", text: $viewModel.email)
                .padding(.bottom, 32)

            MedicButton(title: "Далее", disabled: !viewModel.isValidEmail) {
                Task {
                   try await viewModel.sendEmail()
                }
            }

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
