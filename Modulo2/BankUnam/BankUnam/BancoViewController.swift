//
//  BancoViewController.swift
//  BankUnam
//
//  Created by Diplomado on 13/04/24.
//
import UIKit

class BancoViewController: UIViewController {
    
    @IBOutlet weak var promocionesButton: UIButton!
    
    @IBOutlet weak var welcomeLabel: UILabel! // Outlet para la etiqueta de bienvenida
        
        var username: String? // Propiedad para almacenar el nombre de usuario

    
    override func viewDidLoad() {
            super.viewDidLoad()

            // Mostrar mensaje de bienvenida con el nombre de usuario
            if let username = username {
                welcomeLabel.text = "Welcome, \(username)!" // Mostrar el nombre de usuario en la etiqueta de bienvenida
            }
        }
    
    // Método de acción para el botón de Promociones
    @IBAction func promocionesButtonTapped(_ sender: UIButton) {
        // Navegar a la siguiente vista
        if let nextViewController = storyboard?.instantiateViewController(withIdentifier: "ViewController") {
            navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}

