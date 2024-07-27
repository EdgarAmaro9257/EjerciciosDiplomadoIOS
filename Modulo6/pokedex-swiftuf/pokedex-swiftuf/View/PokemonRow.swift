//
//  PokemonRow.swift
//  pokedex-swiftuf
//
//  Created by Alejandro Mendoza on 26/07/24.
//

import SwiftUI

struct PokemonRow: View {
    let pokemon: Pokemon
    
    private var imageURL: URL? {
        URL(string: pokemon.imageURL)
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            if let imageURL {
                AsyncImage(url: imageURL,
                           content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .border(Color.red)
                    
                }, placeholder: {
                    ProgressView()
                        .frame(width: 100, height: 100)
                })
            }
            
            Text(pokemon.name)
                .font(.title)
                .fontWeight(.bold)
                .border(Color.black)
            Spacer()
        }
    }
}

#Preview {
    PokemonRow(pokemon: pokedex[0])
}
