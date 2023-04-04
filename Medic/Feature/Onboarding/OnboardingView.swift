//
//  OnboardingView.swift
//  Medic
//
//  Created by Vladimir on 02.04.2023.
//

import SwiftUI

struct OnboardingView: View {
    @State private var selection = 1
    @AppStorage("onboarding") var onboarding = true
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Button(action: {
                    onboarding = false
                }) {
                    Text(selection == 3 ? "Завершить" : "Пропустить")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.medicBlue)
                }
                Spacer()
                Image("shape")
            }
            .padding(.leading)
            TabView(selection: $selection) {
                ForEach(OnboardingModel.all) { page in
                    PageView(page: page, selection: $selection).tag(page.id)
                }

            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

struct PageView: View {
    let page: OnboardingModel
    @Binding var selection: Int
    var body: some View {
        VStack(spacing: 40.0) {
            Text(page.title)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.medicGreen)
                .font(.system(size: 14, weight: .regular))
            Text(page.text)
            HStack {
                ForEach(1...3, id: \.self) { index in
                    Circle()
                        .fill(index == page.id ? Color.blue : Color.white)
                        .frame(width: 15, height: 15)
                        .overlay(Circle().stroke(Color.blue))
                        .onTapGesture {
                            selection = index
                        }
                }
            }
            Image(page.image)
                .frame(maxHeight: .infinity, alignment: .center)
        }
    }
}
