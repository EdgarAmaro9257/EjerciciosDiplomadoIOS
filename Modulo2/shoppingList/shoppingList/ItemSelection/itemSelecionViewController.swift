//
//  itemSelecionViewController.swift
//  shoppingList
//
//  Created by Diplomado on 13/04/24.
//

import UIKit

class ItemSelectionViewController: UIViewController {
    // Array to store selected items
    var selectedItems: [String] = []
    
    // Outlets for buttons representing items
    @IBOutlet weak var apples: UIButton!
    @IBOutlet weak var bananas: UIButton!
    @IBOutlet weak var lemons: UIButton!
    @IBOutlet weak var grapes: UIButton!
    @IBOutlet weak var tangerines: UIButton!
    @IBOutlet weak var lettuces: UIButton!
    @IBOutlet weak var mushrooms: UIButton!
    @IBOutlet weak var carrots: UIButton!
    @IBOutlet weak var garlics: UIButton!
    @IBOutlet weak var potatoes: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Additional setup
    }
    
    // Action method for item buttons
    @IBAction func itemButtonTapped(_ sender: UIButton) {
        if let itemName = sender.currentTitle {
            if let index = selectedItems.firstIndex(of: itemName) {
                selectedItems.remove(at: index)
                updateButtonAppearance(sender, isSelected: false)
            } else {
                selectedItems.append(itemName)
                updateButtonAppearance(sender, isSelected: true)
            }
        }
    }
    
    // Function to update button appearance based on selection state
    private func updateButtonAppearance(_ button: UIButton, isSelected: Bool) {
        button.backgroundColor = .green
        if let title = button.titleLabel?.text {
            let newTitle = "✅" + title.dropFirst()
            button.setTitle(newTitle, for: .normal)
        }
    }


    
    // Action method for "Let's Go Shopping" button
    @IBAction func goToShoppingList(_ sender: UIButton) {
        let shoppingListVC = ShoppingListView(nibName: "shoppingListView", bundle: nil)
        shoppingListVC.selectedItems = selectedItems
        navigationController?.pushViewController(shoppingListVC, animated: true)
    }
}



