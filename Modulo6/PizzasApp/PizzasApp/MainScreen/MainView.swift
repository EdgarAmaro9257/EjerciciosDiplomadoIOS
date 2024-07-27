//
//  MainView.swift
//  PizzasApp
//
//  Created by Diplomado on 27/07/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            PizzaListView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Pizzas")
                }
            CreatePizzaView()
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("Crear")
                }
            PizzeriaListView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Pizzerías")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

