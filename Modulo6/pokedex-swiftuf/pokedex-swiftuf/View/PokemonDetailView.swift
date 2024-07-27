//
//  PokemonDetailView.swift
//  pokedex-swiftuf
//
//  Created by Alejandro Mendoza on 26/07/24.
//

import SwiftUI
import MapKit

struct PokemonDetailView: View {
    let pokemon: Pokemon
    
    private var coordinate: CLLocationCoordinate2D? {
        guard let location = pokemon.location else { return nil }
        
        return CLLocationCoordinate2D(latitude: location.latitude,
                                      longitude: location.longitude)
    }
    
    var body: some View {
        VStack(alignment: .center) {
            if let region = mapRegion(), let coordinate {
                Map(initialPosition: .region(region)) {
//                    Marker(pokemon.name, coordinate: coordinate)
                    Marker(coordinate: coordinate) {
                        AsyncImage(url: URL(string: pokemon.imageURL)!)
                    }
//                    Annotation(pokemon.name, coordinate: coordinate) {
//                        AsyncImage(url: URL(string: pokemon.imageURL)!)
//                    }
                    
                }
                    .frame(height: 300)
            }
            
            CircleImage(image: pokemon.imageURL)
                .offset(y: -125)
                .padding(.bottom, -125)
            
            Text(pokemon.name)
                .font(.largeTitle)
            HStack(alignment: .bottom) {
                Text(pokemon.number)
                Text(pokemon.type[0])
                Spacer()
            }
            
            Spacer()
        }
    }
    
    private func mapRegion() -> MKCoordinateRegion? {
        guard let coordinate = coordinate else { return nil }
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        return MKCoordinateRegion(center: coordinate, span: span)
    }
}

#Preview {
    PokemonDetailView(pokemon: pokedex[24])
}
