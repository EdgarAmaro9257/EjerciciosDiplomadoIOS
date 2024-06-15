//
//  NetworkManager.swift
//  PokeAPIApp
//
//  Created by Diplomado on 15/06/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchPokemon(completion: @escaping ([Pokemon]?) -> Void) {
        let urlString = "https://pokeapi.co/api/v2/pokemon"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching data")
                completion(nil)
                return
            }
            do {
                let result = try JSONDecoder().decode(PokemonResponse.self, from: data)
                completion(result.results)
            } catch {
                print("Error decoding data")
                completion(nil)
            }
        }
        task.resume()
    }
}

struct PokemonResponse: Decodable {
    let results: [Pokemon]
}

struct Pokemon: Decodable {
    let name: String
    let url: String
}

