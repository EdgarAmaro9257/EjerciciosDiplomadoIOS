//
//  ContentView.swift
//  PizzasApp
//
//  Created by Diplomado on 27/07/24.
//

import SwiftUI

struct Pizza: Identifiable, Decodable, Encodable {
    var id = UUID()
    var name: String
    var ingredients: [String]
    var imageName: String
}

struct PizzaListView: View {
    let pizzas = [
        Pizza(name: "Pepperoni", ingredients: ["Pepperoni", "Cheese", "Tomato Sauce"], imageName: "pepperoni2"),
        Pizza(name: "Hawaiian", ingredients: ["Ham", "Pineapple", "Cheese"], imageName: "hawaiana"),
        Pizza(name: "Italian", ingredients: ["Pepperoni", "Sausage", "Basil"], imageName: "italiana")
    ]
    
    var body: some View {
        NavigationView {
            List(pizzas) { pizza in
                NavigationLink(destination: PizzaDetailView(pizza: pizza)) {
                    Text(pizza.name)
                }
            }
            .navigationTitle("Nuestras Pizzas")
        }
    }
}

struct PizzaDetailView: View {
    let pizza: Pizza
    
    var body: some View {
        VStack {
            Image(pizza.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .padding()
            Text(pizza.name)
                .font(.largeTitle)
                .padding()
            List(pizza.ingredients, id: \.self) { ingredient in
                Text(ingredient)
            }
        }
        .navigationTitle("Ingredientes")
    }
}


struct PizzaListView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaListView()
    }
}

