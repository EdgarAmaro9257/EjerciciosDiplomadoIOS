//
//  Currency.swift
//  CountryCurrencyApp
//
//  Created by Diplomado on 08/06/24.
//

import Foundation

struct CurrencyConversion {
    let primaryCurrency: String
    let currencyConversionRates: [CurrencyValue]
}

struct CurrencyValue: Codable {
    let SecondaryCurrency: String
    let rate: Double
}

struct CurrencyDTO: Decodable, Hashable {
    let nombre: String
    let moneda: String
}

struct CurrencyConversionDTO: Codable {
    let currency: String
    let rates: [String: Double]
}
