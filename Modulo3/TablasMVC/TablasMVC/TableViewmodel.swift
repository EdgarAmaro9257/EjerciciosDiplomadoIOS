//
//  TableViewmodel.swift
//  TablasMVC
//
//  Created by Diplomado on 17/05/24.
//

import Foundation

struct Row {
    var title: String
    var description: String
}

class TableViewmodel {
    var rowsArray: [Row]
    
    init() {
        rowsArray = [Row(title: "Pikachu", description: "Electrico"), Row(title: "Charmander", description: "Fuego"), Row(title: "Gengar", description: "Fantasma")]
    }
    
    func getCountArray () -> Int {
        rowsArray.count
    }
    
    func getTitleArray (index: IndexPath) -> String {
        rowsArray[index.row].title
    }
    
    func getDescriptionArray (index: IndexPath) -> String {
        rowsArray[index.row].description
    }
    
    func addToArray(text: String) {
        rowsArray.append(Row(title: text, description: ""))
    }
    
    func getSections() -> Int {
        3
    }
    
}
