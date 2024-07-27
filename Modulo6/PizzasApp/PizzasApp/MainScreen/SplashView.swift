//
//  SplashView.swift
//  PizzasApp
//
//  Created by Diplomado on 27/07/24.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false

    var body: some View {
        VStack {
            if isActive {
                MainView() // Esta es la vista principal que contiene el TabView
            } else {
                VStack {
                    Image("pizzaApp")
                        .resizable()
                        .frame(width: 400, height: 400)
                        .padding()
                    Text("PizzaApp")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

