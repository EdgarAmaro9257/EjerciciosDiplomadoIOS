//
//  UserDefaultsManager.swift
//  WeatherApp
//
//  Created by Diplomado on 03/08/24.
//

import Foundation

class UserDefaultsManager {
    private let favoritesKey = "favorites"

    func saveFavorite(location: Location) {
        var favorites = getFavorites()
        favorites.append(location)
        if let encoded = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.set(encoded, forKey: favoritesKey)
        }
    }

    func removeFavorite(location: Location) {
        var favorites = getFavorites()
        favorites.removeAll { $0.id == location.id }
        if let encoded = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.set(encoded, forKey: favoritesKey)
        }
    }

    func getFavorites() -> [Location] {
        if let data = UserDefaults.standard.data(forKey: favoritesKey),
           let favorites = try? JSONDecoder().decode([Location].self, from: data) {
            return favorites
        }
        return []
    }
}


