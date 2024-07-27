//
//  PokemonList.swift
//  pokedex-swiftuf
//
//  Created by Alejandro Mendoza on 26/07/24.
//

import SwiftUI

struct PokemonList: View {
    var body: some View {
        List(pokedex) { pokemon in
            PokemonRow(pokemon: pokemon)
        }
    }
}

#Preview {
    PokemonList()
}
