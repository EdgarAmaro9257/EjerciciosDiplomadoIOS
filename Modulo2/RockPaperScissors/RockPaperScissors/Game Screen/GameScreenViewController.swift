//
//  GameScreenViewController.swift
//  RockPaperScissors
//
//  Created by Diplomado on 04/05/24.
//

// Enumeración para representar las opciones de juego: Rock, Paper, Scissors
enum Choice {
    case rock
    case paper
    case scissors
}

// Enumeración para representar los posibles resultados del juego: Win, Lose, Tie
enum GameResult: String {
    case win = "You win!"
    case lose = "You lose!"
    case tie = "It's a tie!"
}

import UIKit

class GameScreenViewController: UIViewController {
    
    @IBOutlet weak var numberRounds: UILabel!
    @IBOutlet weak var playerName: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var playerNameText: String = "" // Variable para almacenar el nombre del jugador
    var numberOfRounds: Int = 0 // Variable para almacenar el número de rondas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configurar la interfaz gráfica inicial
        view.backgroundColor = .gray // Establecer el color de fondo gris
        playerName.text = playerNameText // Mostrar el nombre del jugador en el UILabel playerName
        updateNumberOfRoundsLabel() // Actualizar el UILabel con el número de rondas seleccionado
    }
    
    // Función para actualizar el UILabel con el número de rondas seleccionado
    func updateNumberOfRoundsLabel() {
        numberRounds.text = "Rounds: \(numberOfRounds)" // Mostrar el número de rondas en el UILabel numberRounds
    }
    
    // Función para manejar el evento de presionar el botón "Rock"
    @IBAction func rockButtonTapped(_ sender: UIButton) {
        playGame(userChoice: .rock) // Llamar a la función playGame con la opción Rock
    }
    
    // Función para manejar el evento de presionar el botón "Paper"
    @IBAction func paperButtonTapped(_ sender: UIButton) {
        playGame(userChoice: .paper) // Llamar a la función playGame con la opción Paper
    }
    
    // Función para manejar el evento de presionar el botón "Scissors"
    @IBAction func scissorsButtonTapped(_ sender: UIButton) {
        playGame(userChoice: .scissors) // Llamar a la función playGame con la opción Scissors
    }
    
    // Función para jugar el juego
    private func playGame(userChoice: Choice) {
        // Generar una elección aleatoria para la computadora
        let computerChoice = randomChoice()
        
        // Determinar el resultado del juego
        let result = determineWinner(userChoice: userChoice, computerChoice: computerChoice)
        
        // Mostrar el resultado en el UILabel
        let resultMessage = "\(result.rawValue), \(playerNameText)!"
        resultLabel.text = resultMessage
        
        // Cambiar el color de fondo según el resultado del juego
        switch result {
        case .win:
            view.backgroundColor = .green
        case .lose:
            view.backgroundColor = .red
        case .tie:
            view.backgroundColor = .brown
        }
    }
    
    // Función para generar una elección aleatoria para la computadora
    private func randomChoice() -> Choice {
        let choices: [Choice] = [.rock, .paper, .scissors]
        let randomIndex = Int(arc4random_uniform(UInt32(choices.count)))
        return choices[randomIndex]
    }
    
    // Función para determinar el resultado del juego
    private func determineWinner(userChoice: Choice, computerChoice: Choice) -> GameResult {
        if userChoice == computerChoice {
            return .tie
        } else if (userChoice == .rock && computerChoice == .scissors) ||
                  (userChoice == .paper && computerChoice == .rock) ||
                  (userChoice == .scissors && computerChoice == .paper) {
            return .win
        } else {
            return .lose
        }
    }
}


