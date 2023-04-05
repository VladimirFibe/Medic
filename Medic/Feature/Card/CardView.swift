import SwiftUI

struct CardView: View {
    var body: some View {
        @ObservedObject var viewModel = CardViewModel()
        VStack(alignment: .leading, spacing: 16.0) {
            Text("Создание карты пациента")
                .font(.system(size: 24, weight: .bold))
            Text("Без карты пациента вы не сможете заказать анализы.")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.medicGray)
            Text("В картах пациентов будут храниться результаты анализов вас и ваших близких.")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.medicGray)
            MedicTextField(title: "Имя", text: $viewModel.firstname)
            MedicTextField(title: "Отчество", text: $viewModel.midlename)
            MedicTextField(title: "Фамилия", text: $viewModel.lastname)
            MedicTextField(title: "Дата рождения", text: $viewModel.birthday)
            MedicTextField(title: "Пол", text: $viewModel.sex)
            MedicButton(title: "Создать", action: viewModel.send)
            Spacer()
        }
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
