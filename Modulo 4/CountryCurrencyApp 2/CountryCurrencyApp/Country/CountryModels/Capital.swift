//
//  Capital.swift
//  CountryCurrencyApp
//
//  Created by Diplomado on 08/06/24.
//

import Foundation

struct Capital: Codable {
    let pais: String
    var estado: [State] = []
    var states: [String] = []
    
    init(pais: String, states: [String]) {
        self.pais = pais
        self.states = states
    }
    
    init?(dictionary: [String: Any]) {
        guard let country = dictionary.keys.first,
              let statesArray = dictionary[country] as? [[String: String]] else {
            return nil
        }

        self.pais = country
        self.estado = statesArray.compactMap { State(dictionary: $0) }
    }
}

struct State: Codable {
    let estado: String
    
    init(estado: String) {
        self.estado = estado
    }

    init?(dictionary: [String: String]) {
        guard let estado = dictionary["estado"] else {
            return nil
        }

        self.estado = estado
    }
}
