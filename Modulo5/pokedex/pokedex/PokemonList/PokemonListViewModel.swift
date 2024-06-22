//
//  PokemonListViewModel.swift
//  pokedex
//
//  Created by Alejandro Mendoza on 21/06/24.
//

import Foundation

protocol PokemonListViewModelDelegate: AnyObject {
    func shouldReloadInformation()
}

class PokemonListViewModel {
    private let pokemonDataFileName = "pokemon_list"
    private let pokemonDataFileExtension = "json"
    
    private var pokemonList = [Pokemon]()
    private var favoritePokemon =  Set<Pokemon>()
    
    let cellIdentifier = "pokemonCellIdentifier"
    let title = "Pokedex"
    var pokemonCount: Int { pokemonList.count }
    
    weak var delegate: PokemonListViewModelDelegate?
    
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
    
    private func saveFavoritePokemon() {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        else {return}
        
        let filename = "favoritePokemon.json"
        let fileURL = documentsDirectory.appending(component: filename)
        let favoritePokemon = Array(favoritePokemon)
        
        do {
            let favoritePokemonData = try JSONEncoder().encode(favoritePokemon)
            let jsonFavoritePokemon = String(data: favoritePokemonData, encoding: .utf8)
            
            try jsonFavoritePokemon?.write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {
            assertionFailure("Failed storing favorite pokemon")
        }
    }
    
    func pokemon(at indexPath: IndexPath) -> Pokemon {
        pokemonList[indexPath.row]
    }
    
    func addToFavoritesPokemon(at indexpath: IndexPath) {
        let pokemon = pokemon(at: indexpath)
        favoritePokemon.insert(pokemon)
        delegate?.shouldReloadInformation()
        saveFavoritePokemon()
    }
    
    func isPokemonInFavorites(_ pokemon: Pokemon) -> Bool {
        favoritePokemon.contains(pokemon)
    }
    
}

// fileprivate
// private
// internal <-
// public
