//
//  PokeElemento.swift
//  Pokedex
//
//  Created by Diplomado on 31/05/24.
//

import Foundation
import UIKit

class PokeElemento{
    var nombreElemento : String!
    var imageElemento : String!
    
    public init(nombreElemento: String, imageElemento: String){
        self.imageElemento = imageElemento
        self.nombreElemento = nombreElemento
    }
}
