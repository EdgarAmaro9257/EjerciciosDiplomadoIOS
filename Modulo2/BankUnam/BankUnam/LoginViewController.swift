//
//  LoginViewController.swift
//  BankUnam
//
//  Created by Diplomado on 06/04/24.
//

import UIKit

class LoginViewController: UIViewController {

    // Outlets for text fields and login button
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var welcomeLabel: UILabel! // Outlet para la etiqueta de bienvenida
       
       var username: String? // Propiedad para almacenar el nombre de usuario

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Disable login button initially
        loginButton.isEnabled = false
        
        // Add observers for text field changes
        usernameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    // Function called when text fields change
    @objc func textFieldDidChange(_ textField: UITextField) {
        // Enable login button if both text fields have text
        if let username = usernameTextField.text, let password = passwordTextField.text {
            loginButton.isEnabled = !username.isEmpty && !password.isEmpty
        }
    }

    // Function called when login button is tapped
  
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        // Verificar que los campos de texto no estén vacíos
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            // Mostrar alerta si falta completar algún campo
            let alert = UIAlertController(title: "Error", message: "Please enter both username and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }

        // Check if login information is correct
        if isLoginValid(username: username, password: password) {
            // Login successful, navigate to welcome screen
            let bancoViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BancoViewController") as! BancoViewController
            bancoViewController.username = username // Pasar el nombre de usuario al BancoViewController
            navigationController?.pushViewController(bancoViewController, animated: true)
        } else {
            // Show alert for incorrect login information
            let alert = UIAlertController(title: "Error", message: "Incorrect username or password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }


    
    // Function to check if login is valid
    func isLoginValid(username: String, password: String) -> Bool {
        // Verificar si el username es válido
        if username != "Diplomado2024" {
            return false
        }
        
        // Separar la contraseña en partes (nombre y mes)
        let components = password.components(separatedBy: "_")
        
        // Asegurarse de que haya exactamente dos componentes (nombre y mes)
        guard components.count == 2 else {
            return false
        }
        
        // Verificar si el mes es válido
        let validMonths = ["January", "january", "February", "february" , "March", "march" , "April", "april" , "May", "may" , "June", "june" , "July", "july" , "August", "august" , "September", "september",  "October",  "october" ,"November",  "november" , "December",  "december"]
        let month = components[1].capitalized
        guard validMonths.contains(month) else {
            return false
        }
        
        // Si pasa todas las verificaciones, la contraseña es válida
        return true
    }
}




