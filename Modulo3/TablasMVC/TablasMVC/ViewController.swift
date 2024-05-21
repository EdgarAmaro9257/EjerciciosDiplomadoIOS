//
//  ViewController.swift
//  TablasMVC
//
//  Created by Diplomado on 17/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    var Model = TableViewmodel()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = Model.getTitleArray(index: indexPath)
        cell?.detailTextLabel?.text = Model.getDescriptionArray(index: indexPath)
        return cell!
    }
    
}

