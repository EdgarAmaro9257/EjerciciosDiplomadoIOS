//
//  ContentView.swift
//  WeatherApp
//
//  Created by Diplomado on 03/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LocationsListView()
                .tabItem {
                    Label("Clima", systemImage: "cloud.sun")
                }

            FavoritesView()
                .tabItem {
                    Label("Favoritos", systemImage: "star.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


