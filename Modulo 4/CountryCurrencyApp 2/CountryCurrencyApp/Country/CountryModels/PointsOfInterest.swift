//
//  PointsOfInterest.swift
//  CountryCurrencyApp
//
//  Created by Manuel Salazar on 6/11/24.
//

import Foundation

struct PointsOfInterestDTO: Codable, Hashable {
    let Paises: [[String: [CitiesDTO]]]
}

struct CitiesDTO: Codable, Hashable {
    let estado: String
    let lugares: [String]
}
