//
//  ContentView.swift
//  RockPaperScissorsGame
//
//  Created by Diplomado on 02/08/24.
//

import SwiftUI

// La vista principal del juego
struct ContentView: View {
    // Estado que guarda el historial de partidas jugadas como una tupla de cuatro elementos (ID único, opción del usuario, opción de la computadora, resultado)
    @State private var gameHistory: [(UUID, String, String, String)] = []
    // Estado que guarda la opción elegida por el usuario en la partida actual
    @State private var userChoice: String?
    // Estado que controla la animación del texto del ganador
    @State private var offsetX: CGFloat = UIScreen.main.bounds.width
    
    // Contadores de victorias
    @State private var userWins = 0
    @State private var computerWins = 0
    
    // Las posibles opciones del juego
    let choices = ["rock", "paper", "scissors"]
    
    var body: some View {
        VStack {
            // Botones para que el usuario elija su opción
            HStack {
                ForEach(choices, id: \.self) { choice in
                    Button(action: {
                        playGame(userChoice: choice)
                    }) {
                        Image(choice) // Muestra la imagen correspondiente a la opción
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding(10)
                    }
                }
            }
            // Muestra el ganador de la partida actual con animación de deslizamiento
            Text("Winner: \(userChoice ?? "Choose")")
                .padding()
                .offset(x: offsetX)
                .animation(.easeInOut(duration: 0.5), value: offsetX)
            // Muestra el puntaje de quién va ganando
            Text("Score - User: \(userWins) | Computer: \(computerWins)")
                .padding()
            // Lista que muestra el historial de partidas jugadas
            List(gameHistory, id: \.0) { game in
                Text("\(game.1) vs \(game.2) --> \(game.3)")
            }
        }
        .padding()
        // Ejecuta este bloque de código cuando cambia el valor de userChoice
        .onChange(of: userChoice) { _ in
            withAnimation {
                // Reinicia el offsetX para la animación de entrada
                offsetX = UIScreen.main.bounds.width
                // Espera un breve momento y luego mueve el texto hacia la pantalla
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    offsetX = 0
                }
                // Después de un segundo, mueve el texto fuera de la pantalla a la derecha
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                    offsetX = UIScreen.main.bounds.width
                }
            }
        }
    }
    
    // Función que se llama cuando el usuario elige una opción
    func playGame(userChoice: String) {
        // La computadora elige una opción aleatoria
        let computerChoice = choices.randomElement()!
        let result: String
        
        // Determina el resultado de la partida
        switch (userChoice, computerChoice) {
        case let (u, c) where u == c:
            result = "Tie" // Empate si las opciones son iguales
        case ("rock", "scissors"), ("scissors", "paper"), ("paper", "rock"):
            result = "User" // El usuario gana en estos casos
            userWins += 1
        default:
            result = "Computer" // En cualquier otro caso, gana la computadora
            computerWins += 1
        }
        
        // Actualiza el estado con el resultado de la partida
        self.userChoice = result
        // Añade la partida al historial con un identificador único
        gameHistory.append((UUID(), userChoice, computerChoice, result))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






