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
    @IBOutlet weak var tableView: UITableView!
    
    var storeData = StoreData.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCellShoppingList")

        // Do any additional setup after loading the view.
    }

    
    @IBAction func addNewItemsArray(_ sender: UIButton) {
        if addItemTextField.text != "" {
            storeData.arrayShoppingList.append(shoppingListStruct(imageProduct: "", nameProduct: addItemTextField.text ?? "Sin información"))
            
            tableView.reloadData()
            addItemTextField.text = ""
        }
    }
}

extension AddItemViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if storeData.searching {
            return storeData.arraySearchShoppingList.count
        } else {
            return storeData.arrayShoppingList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellShoppingList", for: indexPath) as! CustomTableViewCell
        
        let product: shoppingListStruct
        if storeData.searching {
            product = storeData.arraySearchShoppingList[indexPath.row]
        } else {
            product = storeData.arrayShoppingList[indexPath.row]
        }
        
        cell.titleProductLabel.text = product.nameProduct
        
        return cell
    }
}
