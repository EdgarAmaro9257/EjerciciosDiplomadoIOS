//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Diplomado on 03/08/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let apiKey = "fc45889b743d452dbdb25953243107"
    
    func fetchWeather(for location: String, completion: @escaping (Result<Weather, Error>) -> Void) {
        let urlString = "https://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(location)&aqi=no"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let weather = try JSONDecoder().decode(Weather.self, from: data)
                completion(.success(weather))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}


