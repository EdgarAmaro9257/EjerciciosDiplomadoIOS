//
//  Pokemon.swift
//  pokedex
//
//  Created by Alejandro Mendoza on 21/06/24.
//

import Foundation

struct Pokemon: Codable {
    let id: Int
    let name: String
    let number: String
    let type: [String]
    let imageURL: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case number = "num"
        case type
        case imageURL = "img"
    }
}
