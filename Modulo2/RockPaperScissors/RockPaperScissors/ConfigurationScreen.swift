//
//  ConfigurationScreen.swift
//  RockPaperScissors
//
//  Created by Diplomado on 04/05/24.
//

import UIKit

class ConfigurationScreen: UIViewController {
    
    // Outlets for UI elements
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var gameOptionsSegmentedControl: UISegmentedControl!
    @IBOutlet weak var winValueLabel: UILabel!
    @IBOutlet weak var winValueTextField: UITextField!
    @IBOutlet weak var loseValueLabel: UILabel!
    @IBOutlet weak var loseValueTextField: UITextField!
    @IBOutlet weak var scoreToWinLabel: UILabel!
    @IBOutlet weak var scoreToWinTextField: UITextField!
    @IBOutlet weak var roundsLabel: UILabel!
    @IBOutlet weak var roundsSlider: UISlider!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Additional setup
        configureInitialUI()
    }
    
    // Function to configure initial UI state
    private func configureInitialUI() {
        winValueLabel.isHidden = true
        winValueTextField.isHidden = true
        loseValueLabel.isHidden = true
        loseValueTextField.isHidden = true
        scoreToWinLabel.isHidden = true
        scoreToWinTextField.isHidden = true
    }
    
    // Action method for game options segmented control
    @IBAction func gameOptionSelected(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 { // By Rounds
            roundsLabel.isHidden = false
            roundsSlider.isHidden = false
            winValueLabel.isHidden = true
            winValueTextField.isHidden = true
            loseValueLabel.isHidden = true
            loseValueTextField.isHidden = true
            scoreToWinLabel.isHidden = true
            scoreToWinTextField.isHidden = true
        } else { // By Points
            roundsLabel.isHidden = true
            roundsSlider.isHidden = true
            winValueLabel.isHidden = false
            winValueTextField.isHidden = false
            loseValueLabel.isHidden = false
            loseValueTextField.isHidden = false
            scoreToWinLabel.isHidden = false
            scoreToWinTextField.isHidden = false
        }
    }
    
    // Action method for continue button
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        // Crear una instancia del controlador de vista del juego desde el XIB
        let gameScreenVC = GameScreenViewController(nibName: "GameScreenViewController", bundle: nil)
        
        // Configurar cualquier dato necesario en el controlador de vista del juego
        
        // Presentar el controlador de vista del juego
        navigationController?.pushViewController(GameScreenViewController(), animated: true)
    }

    
    // Action method for information button
    @IBAction func informationButtonTapped(_ sender: UIBarButtonItem) {
        // Instantiate the view controller from the storyboard
        if let informationViewController = storyboard?.instantiateViewController(withIdentifier: "InfoViewController") {
            // Present the view controller modally
            present(informationViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func roundsSliderChanged(_ sender: UISlider) {
        let roundedValue = Int(sender.value)
        roundsLabel.text = "Rounds: \(roundedValue)"
    }


}



