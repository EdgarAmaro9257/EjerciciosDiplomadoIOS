//
//  MainViewController.swift
//  PokeAPIApp
//
//  Created by Diplomado on 15/06/24.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var tableView: UITableView!
    private var pokemonList: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "PokeAPI"
        
        setupTableView()
        fetchPokemonData()
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    
    private func fetchPokemonData() {
        NetworkManager.shared.fetchPokemon { [weak self] pokemons in
            guard let self = self, let pokemons = pokemons else { return }
            DispatchQueue.main.async {
                self.pokemonList = pokemons
                self.tableView.reloadData()
            }
        }
    }
    
    // UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = pokemonList[indexPath.row].name.capitalized
        return cell
    }
    
    // UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon = pokemonList[indexPath.row]
        let detailVC = PokemonDetailViewController(pokemon: pokemon)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}


