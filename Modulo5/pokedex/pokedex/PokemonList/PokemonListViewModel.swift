//
//  PokemonListViewModel.swift
//  pokedex
//
//  Created by Alejandro Mendoza on 21/06/24.
//

import Foundation

class PokemonListViewModel {
    private let pokemonDataFileName = "pokemon_list"
    private let pokemonDataFileExtension = "json"
    
    private var pokemonList = [Pokemon]()
    
    let cellIdentifier = "pokemonCellIdentifier"
    let title = "Pokedex"
    var pokemonCount: Int { pokemonList.count }
    
    init() {
        pokemonList = loadPokemonData()
    }
    
    private func loadPokemonData() -> [Pokemon] {
        guard let fileURL = Bundle.main.url(forResource: pokemonDataFileName,
                                            withExtension: pokemonDataFileExtension),
              let data = try? Data(contentsOf: fileURL),
              let pokemonList = try? JSONDecoder().decode([Pokemon].self, from: data)
        else {
            assertionFailure("Cannot read pokemon file")
            return []
        }
        
        return pokemonList
    }
    
    func pokemon(at indexPath: IndexPath) -> Pokemon {
        pokemonList[indexPath.row]
    }
}

// fileprivate
// private
// internal <-
// public
