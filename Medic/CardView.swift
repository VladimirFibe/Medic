//
//  CardView.swift
//  Medic
//
//  Created by Vladimir on 04.03.2023.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        
        VStack {
            Text("Без карты...")
//            MedicTextField(title: "Имя", text: <#T##Binding<String>#>)
            MedicButton(title: "Создать") {
                Task {
                    do {
                        try await MedicHTTPClient.shared.createProfile(card: Card(id: 1, firstname: "Владимир", lastname: "Файб", middlename: "Львович", bith: "1969-07-07", pol: "Мужской", image: ""))
                    } catch {}
                }
            }
        }
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
