import SwiftUI

struct CodeView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    var body: some View {
        VStack {
            TextField("code", text: $viewModel.code)
                .textFieldStyle(.roundedBorder)
            Button {
                Task {
                   try await viewModel.signin()
                }
            } label: {
                Text("Далее")
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
            .disabled(viewModel.code.isEmpty)

        }
        .padding()
    }
}

struct CodeView_Previews: PreviewProvider {
    static var previews: some View {
        CodeView()
            .environmentObject(LoginViewModel())
    }
}

// eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNDQwZTM0ZjA2MTQ4NzRlZTk4OWJmNGEzN2MxYjdkOTAyZTgyNDgyMGU5YWQ4ZTRhMjdkZjRhYjQ2ZWE3OTE2ZWRhOTEyNjc1MTYyYzkyODMiLCJpYXQiOjE2Nzc4NjA0MTYuMDA1NDE4LCJuYmYiOjE2Nzc4NjA0MTYuMDA1NDI2LCJleHAiOjE3MDk0ODI4MTUuOTk3NDk2LCJzdWIiOiIxNTIiLCJzY29wZXMiOltdfQ.DnN4nU1GFji3Fw8ZSLLmj1c0opzwQBj3P1rHNlEGbQgKJU-CW1KSwfpNPlvNAa8VCSvOd1PIV2qyIonLG2MFeMfw-gB-1r-zaKoCgjNmLz3LUsz5NVfkpNtN1JO7vjVdNO1z2piW2Pc8HSctahqQWwddM9RxN7klYt1m49v89kxA0YyrMIK2_JEElJY6cb2pgZRDSxGfr3RQDqaKC0JPGC7Xex-7axznbDIdxEzOZGpjzP1OgDZXO2mRYpLvmSjwO9D8t_9f2FyZzO0AuzKTVTHsXQkW0g_EE7oA9RG36nbEpm88OImvveXZCXyc8VjRWZrq5K-WDmYVJn7FFj1kHvybGgMCqot2YOLf8Se_qqqhs9kMT0XYnX9awXw-VzuBZW2xdqq60jqUo5t_6n1RIkwstwsm86UY2anyYf0vJ9vhnKT-J652sYAZQZFzaD6Bf0FJGKAufRmW9mlgjiUYJAgVbVCG9VfBgF7I3hMYwBcOoZqvBsRsPYn1ax0OmVFIeeAglqGL2fzJoCOJUMsly9u68TVUdeKlbaK_mkynFxEErolW11PD58ovXFzoc_BxPScHeBF_mE64-_ILk77vGEg9C9uj7XLNx3R3oLZ_aLdfCCMTPoS22PDewvWqPGdgteHo8CH4IowzZqiRHuKswgmb6naVXgPCJlTLEtS26ss
