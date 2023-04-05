//
//  BasketView.swift
//  Medic
//
//  Created by Vladimir on 05.04.2023.
//

import SwiftUI

struct BasketView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Корзина")
                Spacer()
                Image(systemName: "trash")
            }
            List(0 ..< 2) { item in
                ForEach(0 ..< 5) { item in
                    BasketItem()
                }
            }
            .listStyle(.plain)
            .listRowSeparator(.hidden)
        }
        .padding()
    }
}

struct BasketItem: View {
    @State private var step = 1
    var body: some View {
        VStack {
            HStack {
                Text("Клинический анализ крови с лейкоцитарной формулировкой")
                Spacer()
                Image(systemName: "xmark")
            }
            Spacer()
            HStack {
                Text("690 ₽")
                Spacer()
                Stepper(value: $step, in: 1...9) {
                    Text("\(step) пациент")
                }
                .frame(width: 200)
            }
            
        }
        .padding(8)
        .frame(height: 138)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
    }
}
struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
    }
}
