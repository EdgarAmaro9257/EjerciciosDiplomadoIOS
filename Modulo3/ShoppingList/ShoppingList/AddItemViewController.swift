//
//  AddItemViewController.swift
//  ShoppingList
//
//  Created by Diplomado on 25/05/24.
//

import UIKit

class AddItemViewController: UIViewController {

    @IBOutlet weak var addItemTextField: UITextField!
    @IBOutlet weak var addItemButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func addNewItemsArray(_ sender: UIButton) {
        if addItemTextField.text != "" {
            arrayShoppingList.append(shoppingListStruct(imageProduct: "", nameProduct: addItemTextField.text ?? "Sin información"))
            
            addItemTextField.text = ""
        }
    }
}
