//
//  FavoritesView.swift
//  WeatherApp
//
//  Created by Diplomado on 03/08/24.
//

import SwiftUI

struct FavoritesView: View {
    @State private var favoriteLocations: [Location] = []

    var body: some View {
        NavigationView {
            VStack {
                if favoriteLocations.isEmpty {
                    Text("No hay ubicaciones favoritas")
                } else {
                    List(favoriteLocations) { location in
                        NavigationLink(destination: WeatherDetailView(location: location)) {
                            HStack {
                                Image(location.nombre)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                Text(location.nombre)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Favoritos")
            .onAppear(perform: loadFavorites)
        }
    }

    private func loadFavorites() {
        favoriteLocations = UserDefaultsManager().getFavorites()
    }
}


