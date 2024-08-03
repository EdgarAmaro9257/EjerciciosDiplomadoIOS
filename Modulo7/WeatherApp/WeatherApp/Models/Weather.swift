//
//  Weather.swift
//  WeatherApp
//
//  Created by Diplomado on 03/08/24.
//

import Foundation

struct Weather: Codable {
    let location: WeatherLocation
    let current: WeatherData
}

struct WeatherData: Codable {
    let temp_c: Double
    let temp_f: Double
    let uv: Double
    let is_day: Int
    let condition: WeatherCondition
    let last_updated: String 
}

struct WeatherLocation: Codable , Identifiable{
    var id: String { name }
    let name: String
    let country: String
    let lat: Double
    let lon: Double
    let localtime: String
    
}

struct WeatherCondition: Codable {
    let text: String
    let icon: String
}


