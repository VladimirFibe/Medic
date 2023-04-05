import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel = CardViewModel()
    var body: some View {
        ScrollView() {
            VStack {
                header
                fields
                MedicButton(title: "Сохранить", action: viewModel.send)

            }
        }
        .padding()
        .onAppear {
            
        }
    }
    var fields: some View {
        VStack {
            MedicTextField(title: "Имя", text: $viewModel.firstname)
            MedicTextField(title: "Отчество", text: $viewModel.midlename)
            MedicTextField(title: "Фамилия", text: $viewModel.lastname)
            MedicTextField(title: "Дата рождения", text: $viewModel.birthday)
            MedicTextField(title: "Пол", text: $viewModel.sex)
        }
    }
    var header: some View {
        VStack(alignment: .leading) {
            Text("Карта пациента")
                .font(.system(size: 24, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .center)
            Image("person")
                .frame(maxWidth: .infinity, alignment: .center)

            Text("Без карты пациента вы не сможете заказать анализы.")

            Text("В картах пациентов будут храниться результаты анализов вас и ваших близких.")
        }
        .font(.system(size: 14, weight: .regular))
        .foregroundColor(.medicGray)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
