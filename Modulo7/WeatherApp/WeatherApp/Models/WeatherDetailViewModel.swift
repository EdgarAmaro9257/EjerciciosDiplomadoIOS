//
//  WeatherDetailViewModel.swift
//  WeatherApp
//
//  Created by Diplomado on 03/08/24.
//

import SwiftUI
import MapKit

enum TemperatureUnit: String {
    case celsius = "C"
    case fahrenheit = "F"
}

class WeatherDetailViewModel: ObservableObject {
    @Published var unit: TemperatureUnit = .celsius
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    func convertTemperature(_ weather: Weather) -> String {
        switch unit {
        case .celsius:
            return "\(weather.current.temp_c)°C"
        case .fahrenheit:
            return "\(weather.current.temp_f)°F"
        }
    }
}



