//
//  PokemonLocationViewModel.swift
//  pokedex
//
//  Created by Alejandro Mendoza on 22/06/24.
//

import CoreLocation
import UIKit

protocol PokemonLocationViewModelDelegate where Self: UIViewController {
    func showPokemonLocation(coordinate: CLLocationCoordinate2D)
    func showRouteBetween(userLocation: CLLocationCoordinate2D, pokemonLocation: CLLocationCoordinate2D)
}

class PokemonLocationViewModel: NSObject {
    private let locationManager = CLLocationManager()
    
    private let pokemonLocation: CLLocationCoordinate2D?
    private var userLocation: CLLocationCoordinate2D?
    
    weak var delegate: PokemonLocationViewModelDelegate?
   
    init(pokemonLocation: CLLocationCoordinate2D?) {
        self.pokemonLocation = pokemonLocation
        super.init()
        setupLocationManager()
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func shouldShowPokemonLoacation() {
        guard let location = pokemonLocation else { return }
        delegate?.showPokemonLocation(coordinate: location)
    }
    
    func shouldShowDirectionsToPokemon() {
        guard let userLocation, let pokemonLocation = pokemonLocation else { return }
        
        delegate?.showRouteBetween(userLocation: userLocation,
                                   pokemonLocation: pokemonLocation)
    }
}

extension PokemonLocationViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                                longitude: location.coordinate.longitude)
        
        userLocation = coordinate
    }
}
