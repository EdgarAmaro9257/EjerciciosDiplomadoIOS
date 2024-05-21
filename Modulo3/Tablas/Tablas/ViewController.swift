//
//  ViewController.swift
//  Tablas
//
//  Created by Diplomado on 17/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var array = ["Uno", "Dos", "Tres"]
    let arrayDos = ["Cuatro", "Cinco", "Seis", "Siete"]

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButton(_ sender: Any) {
        array.append(textField.text ?? "")
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Mi tabla"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        "Fin de tabla"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            arrayDos.count
        } else {
            array.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell
        
        if indexPath.section == 0 {
            cell?.cellTextLabel.text = arrayDos[indexPath.row]
        } else {
            cell?.cellTextLabel.text = array[indexPath.row]
        }
        
        
//        var cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
//        cell.textLabel?.text = "Hello"
//        cell.detailTextLabel?.text = " a todos"
        
//        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
//        
//        if cell == nil {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//            cell?.backgroundColor = .gray
//            cell?.accessoryType = .disclosureIndicator
//        }
//        
//        if #available(iOS 14, *){
//            var content = cell?.defaultContentConfiguration()
//            content?.text = array[indexPath.row]
//            cell?.contentConfiguration = content
//        }else {
//            cell?.textLabel?.text = "Hello"
//        }
       
        return cell!
        
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            70.0
        } else {
            50.0
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
}
