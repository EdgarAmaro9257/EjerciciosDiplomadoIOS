//
//  TabBarController.swift
//  TabBarProgramatico
//
//  Created by Diplomado on 31/05/24.
//

import UIKit

class TabBarController: UITabBarController {
    
    let first = FirstViewController()
    let second = SecondViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewControllers([first, second], animated: true)
        tabBar.backgroundColor = .blue
        tabBar.tintColor = .white
        
    
    }
    
}
