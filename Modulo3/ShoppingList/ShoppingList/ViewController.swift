//
//  ViewController.swift
//  ShoppingList
//
//  Created by Diplomado on 25/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var shoppingListSearchBar: UISearchBar!
    @IBOutlet weak var shoppingListTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        shoppingListTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingListTableView.dataSource = self
        shoppingListTableView.delegate = self
        shoppingListSearchBar.delegate = self
        shoppingListTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCellShoppingList")
    }
    
    func reloadDataSourceTable() {
        shoppingListTableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return arraySearchShoppingList.count
        } else {
            return arrayShoppingList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = shoppingListTableView.dequeueReusableCell(withIdentifier: "CustomCellShoppingList", for: indexPath) as! CustomTableViewCell
        
        let product: shoppingListStruct
        if searching {
            product = arraySearchShoppingList[indexPath.row]
        } else {
            product = arrayShoppingList[indexPath.row]
        }
        
        cell.titleProductLabel.text = product.nameProduct
        
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searching = false
            arraySearchShoppingList.removeAll()
        } else {
            searching = true
            arraySearchShoppingList = arrayShoppingList.filter { $0.nameProduct.lowercased().contains(searchText.lowercased()) }
        }
        shoppingListTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        shoppingListTableView.reloadData()
    }
}

