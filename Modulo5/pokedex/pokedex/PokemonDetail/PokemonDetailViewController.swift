//
//  PokemonDetailViewController.swift
//  pokedex
//
//  Created by Alejandro Mendoza on 21/06/24.
//

import UIKit

class PokemonDetailViewController: UIViewController {

    private let viewModel: PokemonDetailViewModel
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private lazy var pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        let image = UIImage(systemName: "lizard")
        imageView.image = image
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        return imageView
    }()
    
    private lazy var pokemonName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = viewModel.pokemonName
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.adjustsFontForContentSizeCategory = true
        
        label.accessibilityLabel = nil
        
        return label
    }()
    
    private lazy var pokemonLocationButton: UIButton = {
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.title = "Pokemon location"
        
        return UIButton(configuration: buttonConfiguration)
    }()
    
    init(pokemon: Pokemon) {
        viewModel = PokemonDetailViewModel(with: pokemon)
        
        super.init(nibName: nil, bundle: nil)
        
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        let contentViewHeightAnchor = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        contentViewHeightAnchor.isActive = true
        contentViewHeightAnchor.priority = .required - 1
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        
        
        let pokemonInfoStack = UIStackView()
        pokemonInfoStack.translatesAutoresizingMaskIntoConstraints = false
        pokemonInfoStack.axis = .vertical
        pokemonInfoStack.distribution = .fillProportionally
        
        pokemonInfoStack.addArrangedSubview(pokemonImageView)
        pokemonInfoStack.addArrangedSubview(pokemonName)
        pokemonInfoStack.addArrangedSubview(pokemonLocationButton)
        
        contentView.addSubview(pokemonInfoStack)
        
        NSLayoutConstraint.activate([
            pokemonInfoStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            pokemonInfoStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            pokemonInfoStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            pokemonInfoStack.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
        ])
        
        pokemonLocationButton.addTarget(self, action: #selector(locationButtonTapped), for: .touchUpInside)
        
    }
    
    @objc
    func locationButtonTapped() {
        present(PokemonLocationViewController(), animated: true)
    }
    
}

extension PokemonDetailViewController: PokemonDetailViewModelDelegate {
    func updatePokemonImage(to image: UIImage) {
        pokemonImageView.image = image
    }
}
