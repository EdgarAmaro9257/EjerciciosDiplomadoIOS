//
//  ContentView.swift
//  pokedex-swiftuf
//
//  Created by Alejandro Mendoza on 26/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView(sidebar: {
            List(pokedex) { pokemon in
                NavigationLink(destination: {
                    PokemonDetailView(pokemon: pokemon)
                }, label: {
                    PokemonRow(pokemon: pokemon)
                })
            }
            .navigationTitle("pokedex")
        }, detail: {
            Text("Select a pokemon")
        })
    }
}

#Preview {
    ContentView()
}
