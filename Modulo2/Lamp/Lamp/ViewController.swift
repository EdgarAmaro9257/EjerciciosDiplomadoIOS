//
//  ViewController.swift
//  Lamp
//
//  Created by Diplomado on 06/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lampButton: UIButton!

    var isLampOn = false // Estado inicial de la lámpara: apagada

    override func viewDidLoad() {
        super.viewDidLoad()
        // Configuración inicial de la interfaz de usuario
        view.backgroundColor = .black // La lámpara está apagada al iniciar la aplicación
        lampButton.setTitle("Turn On", for: .normal)
    }

    // Función llamada cuando se presiona el botón de la lámpara
    @IBAction func lampButtonTapped(_ sender: UIButton) {
        // Cambiar el estado de la lámpara
        isLampOn.toggle()

        // Actualizar la apariencia de la pantalla según el estado de la lámpara
        if isLampOn {
            // Encender la lámpara
            view.backgroundColor = .white
            lampButton.setTitle("Turn Off", for: .normal)
        } else {
            // Apagar la lámpara
            view.backgroundColor = .black
            lampButton.setTitle("Turn On", for: .normal)
        }
    }
}


