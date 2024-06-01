//
//  dataShoppingList.swift
//  ShoppingList
//
//  Created by Diplomado on 25/05/24.
//

import Foundation

struct shoppingListStruct {
    var imageProduct: String
    var nameProduct: String
}

class StoreData {
    var arrayShoppingList: [shoppingListStruct] = []
    var arraySearchShoppingList: [shoppingListStruct] = []

    var searching = false
    
    static let shared = StoreData()
}
