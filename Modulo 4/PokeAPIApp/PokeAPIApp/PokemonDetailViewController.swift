//
//  PokemonDetailViewController.swift
//  PokeAPIApp
//
//  Created by Diplomado on 15/06/24.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    private let pokemon: Pokemon
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = pokemon.name.capitalized
        
        fetchPokemonDetail()
    }
    
    private func fetchPokemonDetail() {
        guard let url = URL(string: pokemon.url) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching detail")
                return
            }
            do {
                let detail = try JSONDecoder().decode(PokemonDetail.self, from: data)
                DispatchQueue.main.async {
                    self.setupDetailView(with: detail)
                }
            } catch {
                print("Error decoding detail")
            }
        }
        task.resume()
    }
    
    private func setupDetailView(with detail: PokemonDetail) {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        if let url = URL(string: detail.sprites.front_default), let data = try? Data(contentsOf: url) {
            imageView.image = UIImage(data: data)
        }
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

struct PokemonDetail: Decodable {
    let sprites: Sprites
}

struct Sprites: Decodable {
    let front_default: String
}

