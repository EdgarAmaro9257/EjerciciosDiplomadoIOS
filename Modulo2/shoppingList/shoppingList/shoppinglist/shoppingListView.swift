//
//  shoppingListView.swift
//  shoppingList
//
//  Created by Diplomado on 13/04/24.
//

import UIKit

class ShoppingListView: UIViewController {
    // Array to store selected items
    var selectedItems: [String] = []
    
    // Outlet for displaying selected items
    @IBOutlet weak var shoppingListLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayShoppingList()
    }
    
    // Function to display the shopping list
    func displayShoppingList() {
        let shoppingListText = selectedItems.joined(separator: ", ")
        shoppingListLabel.text = "Shopping List: \(shoppingListText)"
    }
}
