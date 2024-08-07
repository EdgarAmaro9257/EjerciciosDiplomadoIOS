//
//  Pokemon.swift
//  pokedex-swiftuf
//
//  Created by Alejandro Mendoza on 26/07/24.
//

import Foundation

struct Pokemon: Codable, Identifiable {
    struct Location: Codable {
        let latitude: Double
        let longitude: Double
    }
    
    let id: Int
    let number: String
    let name: String
    let imageURL: String
    let type: [String]
    let location: Location?
    
    enum CodingKeys: String, CodingKey {
        case id
        case number = "num"
        case name
        case imageURL = "img"
        case type
        case location
    }
}
