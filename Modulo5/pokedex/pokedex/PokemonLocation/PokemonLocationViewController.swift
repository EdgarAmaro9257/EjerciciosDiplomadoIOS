//
//  PokemonLocationViewController.swift
//  pokedex
//
//  Created by Alejandro Mendoza on 21/06/24.
//

import UIKit
import MapKit
import CoreLocation

class PokemonLocationViewController: UIViewController {
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.preferredConfiguration = MKHybridMapConfiguration()
        mapView.showsUserLocation = true
        
        return mapView
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Dismiss", for: .normal)
        button.backgroundColor = .red
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, 
                         action: #selector(closeButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var showPokemonButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Show pokemon"
        
        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
       
        button.addTarget(self, 
                         action: #selector(showPokemonButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var showDirectionsButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Show directions"
        
        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
       
        button.addTarget(self,
                         action: #selector(showDirectionsToPokemon),
                         for: .touchUpInside)
        return button
    }()
    
    private var viewModel: PokemonLocationViewModel
    
    init(pokemonLocation: Pokemon.Location?) {
        if let location = pokemonLocation {
            let coordinate = CLLocationCoordinate2D(latitude: location.latitude,
                                                    longitude: location.longitude)
            viewModel = PokemonLocationViewModel(pokemonLocation: coordinate)
        } else {
            viewModel = PokemonLocationViewModel(pokemonLocation: nil)
        }
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        mapView.delegate = self
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(mapView)
        view.addSubview(closeButton)

        let pokemonInteractionStackView = UIStackView()
        pokemonInteractionStackView.translatesAutoresizingMaskIntoConstraints = false
        pokemonInteractionStackView.axis = .horizontal
        pokemonInteractionStackView.distribution = .fillProportionally
        
        pokemonInteractionStackView.addArrangedSubview(showPokemonButton)
        pokemonInteractionStackView.addArrangedSubview(showDirectionsButton)
        
        view.addSubview(pokemonInteractionStackView)
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            pokemonInteractionStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            pokemonInteractionStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc
    private func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func showPokemonButtonTapped() {
        viewModel.shouldShowPokemonLoacation()
    }

    @objc
    private func showDirectionsToPokemon() {
        viewModel.shouldShowDirectionsToPokemon()
    }
}

extension PokemonLocationViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: any MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        
        renderer.strokeColor = .red
        renderer.lineWidth = 10.0
        return renderer
    }
}

extension PokemonLocationViewController: PokemonLocationViewModelDelegate {
    func showPokemonLocation(coordinate: CLLocationCoordinate2D) {
        let pokemonAnnotation = MKPointAnnotation()
        pokemonAnnotation.coordinate = coordinate
        
        mapView.addAnnotation(pokemonAnnotation)
        
        let mapRegion = MKCoordinateRegion(center: coordinate,
                                           span: MKCoordinateSpan(latitudeDelta: 0.01,
                                                                  longitudeDelta: 0.01))
        
        mapView.region = mapRegion
    }
    
    func showRouteBetween(userLocation: CLLocationCoordinate2D, pokemonLocation: CLLocationCoordinate2D) {
        let directionsRequest = MKDirections.Request()
        
        directionsRequest.source = MKMapItem(placemark: MKPlacemark(coordinate: userLocation))
        directionsRequest.destination = MKMapItem(placemark: MKPlacemark(coordinate: pokemonLocation))
        
        directionsRequest.transportType = .walking
        
        let directions = MKDirections(request: directionsRequest)
        
        directions.calculate {[weak self] response, error in
            guard  error == nil,
                   let response,
                   let route = response.routes.first
            else { return }
            
            self?.mapView.addOverlay(route.polyline)
        }
    }
}
