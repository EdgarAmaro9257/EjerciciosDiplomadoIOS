//
//  PokemonListTableViewController.swift
//  pokedex
//
//  Created by Alejandro Mendoza on 21/06/24.
//

import UIKit

class PokemonListTableViewController: UITableViewController {
    let viewModel = PokemonListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: viewModel.cellIdentifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.pokemonCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellIdentifier,
                                                 for: indexPath)
        
        let pokemon = viewModel.pokemon(at: indexPath)
        
        var cellConfigurator = cell.defaultContentConfiguration()
        
        if viewModel.isPokemonInFavorites(pokemon) {
            title = "❤️ \(pokemon.name)"
        } else {
            title = pokemon.name
        }
        
        cellConfigurator.text = title
        cellConfigurator.secondaryText = pokemon.number
        
        cell.contentConfiguration = cellConfigurator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath,
                              animated: true)
        let selectedPokemon = viewModel.pokemon(at: indexPath)
        
        let detailViewController = PokemonDetailViewController(pokemon: selectedPokemon)
        navigationController?.pushViewController(detailViewController, animated: true)
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let favoritesAction = UIContextualAction(style: .normal, title: "Add to Favorites") {
            [weak self] _, _, completion in
            self?.viewModel.addToFavoritesPokemon(at: indexPath)
        }

        favoritesAction.backgroundColor = .red
        favoritesAction.image = UIImage(systemName: "heart")
        return UISwipeActionsConfiguration(actions: [favoritesAction])
    }
}

extension PokemonListTableViewController: PokemonListViewModelDelegate {
    func shouldReloadInformation() {
        tableView.reloadData()
    }
}
