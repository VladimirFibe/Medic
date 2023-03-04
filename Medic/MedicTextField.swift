//
//  MedicTextField.swift
//  Medic
//
//  Created by Vladimir on 04.03.2023.
//

import SwiftUI

struct MedicTextField: View {
    let title: String
    @Binding var text: String
    var body: some View {
        TextField(title, text: $text)
            .textFieldStyle(.roundedBorder)
    }
}

struct MedicTextField_Previews: PreviewProvider {
    static var previews: some View {
        MedicTextField(title: "Имя", text: .constant(""))
            .padding()
    }
}
