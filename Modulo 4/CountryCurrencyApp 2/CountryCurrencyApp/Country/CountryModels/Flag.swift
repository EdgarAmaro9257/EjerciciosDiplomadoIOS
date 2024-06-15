//
//  Flag.swift
//  CountryCurrencyApp
//
//  Created by Diplomado on 08/06/24.
//

import Foundation

struct Flag: Codable {
    let pais: String
    let codigo: String
    
    init(pais: String, codigo: String) {
        self.pais = pais
        self.codigo = codigo
    }

    init?(dictionary: [String: String]) {
        guard let country = dictionary.keys.first,
              let code = dictionary[country] else {
            return nil
        }

        self.pais = country
        self.codigo = code
    }
}
