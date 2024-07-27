//
//  CreatePizzaView.swift
//  PizzasApp
//
//  Created by Diplomado on 27/07/24.
//

import SwiftUI

struct CreatePizzaView: View {
    @State private var selectedIngredients: [String] = []
    @State private var showAlert = false
    @State private var pizzas: [Pizza] = []

    let ingredients = ["Pepperoni", "Ham", "Cheese", "Tomato Sauce", "Pineapple", "Basil"]

    var body: some View {
        NavigationView {
            VStack {
                List(ingredients, id: \.self) { ingredient in
                    Button(action: {
                        toggleIngredient(ingredient)
                    }) {
                        HStack {
                            Text(ingredient)
                            Spacer()
                            if selectedIngredients.contains(ingredient) {
                                Image(systemName: "checkmark")
                            }
                        }
                        .contentShape(Rectangle()) // Makes the entire HStack tappable
                        .padding()
                    }
                }
                
                List(pizzas) { pizza in
                    NavigationLink(destination: PizzaDetailView(pizza: pizza)) {
                        Text(pizza.name)
                    }
                }
                .padding()
                
                Button(action: createPizza) {
                    Text("Crear Pizza")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("Tus Pizzas")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Pizza Guardada"),
                      message: Text("La pizza ha sido guardada y está en la lista."),
                      dismissButton: .default(Text("OK")))
            }
            .onAppear(perform: loadPizzas)
        }
    }

    private func toggleIngredient(_ ingredient: String) {
        if let index = selectedIngredients.firstIndex(of: ingredient) {
            selectedIngredients.remove(at: index)
        } else {
            selectedIngredients.append(ingredient)
        }
    }

    private func createPizza() {
        let pizzaCount = pizzas.count + 1
        let newPizza = Pizza(name: "Pizza \(pizzaCount)", ingredients: selectedIngredients, imageName: "pizzaApp")

        pizzas.append(newPizza)
        savePizzas()
        selectedIngredients.removeAll()
        showAlert = true
    }

    private func savePizzas() {
        let fileManager = FileManager.default
        guard let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileURL = documentDirectory.appendingPathComponent("pizzas.json")

        if let encodedData = try? JSONEncoder().encode(pizzas) {
            try? encodedData.write(to: fileURL)
        }
    }

    private func loadPizzas() {
        let fileManager = FileManager.default
        guard let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileURL = documentDirectory.appendingPathComponent("pizzas.json")

        if let data = try? Data(contentsOf: fileURL),
           let decodedPizzas = try? JSONDecoder().decode([Pizza].self, from: data) {
            pizzas = decodedPizzas
        }
    }
}

struct CreatePizzaView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePizzaView()
    }
}







