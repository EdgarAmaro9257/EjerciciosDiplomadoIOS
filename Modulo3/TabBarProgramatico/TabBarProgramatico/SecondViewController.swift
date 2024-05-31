//
//  SecondViewController.swift
//  TabBarProgramatico
//
//  Created by Diplomado on 31/05/24.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        self.title = "Segundo"
        self.tabBarItem.image = UIImage(systemName: "eraser")
        self.tabBarItem.selectedImage = UIImage(systemName: "eraser.fill")

        // Do any additional setup after loading the view.
    }
    
}
