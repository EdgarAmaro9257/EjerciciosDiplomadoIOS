//
//  ViewController.swift
//  BankUnam
//
//  Created by Diplomado on 22/03/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logOut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutButtonPressed(_ sender: UIButton) {
        // Si el ViewController actual está presentado en un UINavigationController
        if let navigationController = self.navigationController {
            navigationController.popToRootViewController(animated: true)
        } else {
            // Si el ViewController actual no está en un UINavigationController, usa dismiss
            self.dismiss(animated: true, completion: nil)
        }
    }
}


