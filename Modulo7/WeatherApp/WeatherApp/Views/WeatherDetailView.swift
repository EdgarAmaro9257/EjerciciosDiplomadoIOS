//
//  WeatherDetailView.swift
//  WeatherApp
//
//  Created by Diplomado on 03/08/24.
//

import SwiftUI
import MapKit

struct WeatherDetailView: View {
    @State private var weather: Weather?
    @State private var isFavorite = false
    let location: Location
    @StateObject private var viewModel = WeatherDetailViewModel()

    var body: some View {
        VStack {
            HStack {
                // Nombre del país
                Text(location.nombre)
                    .font(.title)
                    .padding(.leading, 20)
                
                Spacer()
                
                // Botón de favorito
                Button(action: toggleFavorite) {
                    Image(systemName: isFavorite ? "star.fill" : "star")
                        .font(.largeTitle)
                }
                .padding(.trailing, 20)
            }
            .padding(.top, 20)
            
            // Selector de temperatura
            Picker("Temperatura", selection: $viewModel.unit) {
                Text("Celsius").tag(TemperatureUnit.celsius)
                Text("Fahrenheit").tag(TemperatureUnit.fahrenheit)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            if let weather = weather {
                // Contenedor para imagen del clima, temperatura y índice UV
                HStack {
                    if let iconUrl = URL(string: "https://cdn.weatherapi.com/weather/64x64/\(weather.current.condition.icon)") {
                        AsyncImage(url: iconUrl) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(width: 60, height: 60)
                            case .success(let image):
                                image.resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                            case .failure(let error):
                                Text("Error: \(error.localizedDescription)")
                                    .frame(width: 60, height: 60)
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .frame(width: 60, height: 60)
                    } else {
                        Text("No Icon")
                            .frame(width: 60, height: 60)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Temperatura: \(viewModel.convertTemperature(weather))")
                        Text("UV: \(weather.current.uv)")
                    }
                }
                .padding()

                // Mapa
                Map(coordinateRegion: $viewModel.region, annotationItems: [weather.location]) { location in
                    MapMarker(coordinate: CLLocationCoordinate2D(latitude: location.lat, longitude: location.lon), tint: .blue)
                }
                .frame(height: 250)
                .padding()

                // Última actualización
                Text("Última Actualización: \(formatDate(weather.location.localtime))")
                    .padding(.bottom, 20)
            } else {
                ProgressView()
            }
        }
        .onAppear(perform: loadWeather)
        .background(Color.blue.opacity(0.3))
    }

    private func formatDate(_ dateString: String) -> String {
        // Formatear la cadena de fecha. Puedes ajustar esto según el formato de fecha deseado.
        return dateString
    }

    private func loadWeather() {
        NetworkManager.shared.fetchWeather(for: location.nombre) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let weatherData):
                    self.weather = weatherData
                    isFavorite = UserDefaultsManager().getFavorites().contains(where: { $0.id == location.id })
                    viewModel.region = MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: weatherData.location.lat, longitude: weatherData.location.lon),
                        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                    )
                case .failure(let error):
                    print("Error al obtener el clima: \(error)")
                }
            }
        }
    }

    private func toggleFavorite() {
        let userDefaultsManager = UserDefaultsManager()
        if isFavorite {
            userDefaultsManager.removeFavorite(location: location)
        } else {
            userDefaultsManager.saveFavorite(location: location)
        }
        isFavorite.toggle()
    }
}








