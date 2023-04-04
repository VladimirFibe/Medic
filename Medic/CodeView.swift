import SwiftUI

struct CodeView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    var body: some View {
        VStack {
            Text("Введите код из E-mail")
                .font(.system(size: 17, weight: .semibold))
                .padding(.bottom, 24)
            passcode
            Text("Отправить код повторно можно будет через 42 секунд")
                .font(.system(size: 15))
                .foregroundColor(.medicGray)
                .padding(.top, 16)            
        }
        .padding()
    }
    

    var passcode: some View {
        ZStack {
            pinDots
            backgroundField
        }
    }
    private var pinDots: some View {
        HStack(spacing: 16.0) {
            let roundRect = RoundedRectangle(cornerRadius: 10, style: .continuous)
            ForEach(0..<4) { index in
                Text(viewModel.getImageName(at: index))
                    .font(.system(size: 20))
                    .frame(width: 46, height: 46)
                    .background(roundRect.fill(Color.inputBackground))
                    .overlay(roundRect.stroke(Color.inputStroke, lineWidth: 1))
                    
            }
        }
    }
    
    private var backgroundField: some View {
        let boundPin = Binding<String>(get: { self.viewModel.code }, set: { newValue in
            self.viewModel.code = newValue
            viewModel.submitPin()
        })
        
        return TextField("", text: boundPin, onCommit: viewModel.submitPin)
            .accentColor(.clear)
            .foregroundColor(.clear)
            .keyboardType(.numberPad)
    }
}

struct CodeView_Previews: PreviewProvider {
    static var previews: some View {
        CodeView()
            .environmentObject(LoginViewModel())
    }
}

extension String {
    
    var digits: [Int] {
        var result = [Int]()
        
        for char in self {
            if let number = Int(String(char)) {
                result.append(number)
            }
        }
        
        return result
    }
    
}

extension Int {
    
    var numberString: String {
        
        guard self < 10 else { return "0" }
        
        return String(self)
    }
}

// eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNDQwZTM0ZjA2MTQ4NzRlZTk4OWJmNGEzN2MxYjdkOTAyZTgyNDgyMGU5YWQ4ZTRhMjdkZjRhYjQ2ZWE3OTE2ZWRhOTEyNjc1MTYyYzkyODMiLCJpYXQiOjE2Nzc4NjA0MTYuMDA1NDE4LCJuYmYiOjE2Nzc4NjA0MTYuMDA1NDI2LCJleHAiOjE3MDk0ODI4MTUuOTk3NDk2LCJzdWIiOiIxNTIiLCJzY29wZXMiOltdfQ.DnN4nU1GFji3Fw8ZSLLmj1c0opzwQBj3P1rHNlEGbQgKJU-CW1KSwfpNPlvNAa8VCSvOd1PIV2qyIonLG2MFeMfw-gB-1r-zaKoCgjNmLz3LUsz5NVfkpNtN1JO7vjVdNO1z2piW2Pc8HSctahqQWwddM9RxN7klYt1m49v89kxA0YyrMIK2_JEElJY6cb2pgZRDSxGfr3RQDqaKC0JPGC7Xex-7axznbDIdxEzOZGpjzP1OgDZXO2mRYpLvmSjwO9D8t_9f2FyZzO0AuzKTVTHsXQkW0g_EE7oA9RG36nbEpm88OImvveXZCXyc8VjRWZrq5K-WDmYVJn7FFj1kHvybGgMCqot2YOLf8Se_qqqhs9kMT0XYnX9awXw-VzuBZW2xdqq60jqUo5t_6n1RIkwstwsm86UY2anyYf0vJ9vhnKT-J652sYAZQZFzaD6Bf0FJGKAufRmW9mlgjiUYJAgVbVCG9VfBgF7I3hMYwBcOoZqvBsRsPYn1ax0OmVFIeeAglqGL2fzJoCOJUMsly9u68TVUdeKlbaK_mkynFxEErolW11PD58ovXFzoc_BxPScHeBF_mE64-_ILk77vGEg9C9uj7XLNx3R3oLZ_aLdfCCMTPoS22PDewvWqPGdgteHo8CH4IowzZqiRHuKswgmb6naVXgPCJlTLEtS26ss
