//
//  TabBarViewContoller.swift
//  CountryCurrencyApp
//
//  Created by Manuel Salazar on 6/11/24.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Crear las vistas
        let countriesViewController = CountriesViewController()
        let currencyViewController = CurrencyViewController()
        
        // Asignar las vistas a los controladores de navegación
        let countriesNavController = UINavigationController(rootViewController: countriesViewController)
        let currencyNavController = UINavigationController(rootViewController: currencyViewController)
        
        // Configurar los títulos y las imágenes de las pestañas
        countriesNavController.tabBarItem = UITabBarItem(title: "Countries", image: UIImage(systemName: "globe"), tag: 0)
        currencyNavController.tabBarItem = UITabBarItem(title: "Currency", image: UIImage(systemName: "dollarsign.circle"), tag: 1)
        
        // Asignar los controladores de navegación al controlador de la barra de pestañas
        self.viewControllers = [countriesNavController, currencyNavController]
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification), name: .currencyTapped, object: nil)
        
    }
    
    @objc func handleNotification() {
        self.selectedIndex = 1
    }
    
}
