//
//  Pokemon.swift
//  pokedex
//
//  Created by Alejandro Mendoza on 21/06/24.
//

import Foundation

struct Pokemon: Codable, Hashable {
    struct Location: Codable, Hashable {
        let latitude: Double
        let longitude: Double
    }

    let id: Int
    let name: String
    let number: String
    let type: [String]
    let imageURL: String
    let location: Location?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case number = "num"
        case type
        case imageURL = "img"
        case location
    }
    
    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}



