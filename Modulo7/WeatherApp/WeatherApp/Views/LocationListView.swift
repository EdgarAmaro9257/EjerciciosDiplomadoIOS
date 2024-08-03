//
//  LocationListView.swift
//  WeatherApp
//
//  Created by Diplomado on 03/08/24.
//

import SwiftUI

struct LocationsListView: View {
    @State private var locations: [Location] = []

    var body: some View {
        NavigationView {
            List(locations) { location in
                NavigationLink(destination: WeatherDetailView(location: location)) {
                    HStack {
                        Image(location.nombre)
                            .resizable()
                            .frame(width: 40, height: 40)
                        Text(location.nombre)
                    }
                }
            }
            .navigationTitle("Ubicaciones")
            .onAppear(perform: loadLocations)
        }
    }

    private func loadLocations() {
        if let url = Bundle.main.url(forResource: "LocationList", withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let locations = try? JSONDecoder().decode([Location].self, from: data) {
            self.locations = locations
        }
    }
}


