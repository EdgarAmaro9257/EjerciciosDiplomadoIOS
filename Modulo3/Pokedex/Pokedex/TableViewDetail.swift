//
//  TableViewDetail.swift
//  Pokedex
//
//  Created by Diplomado on 31/05/24.
//

import Foundation
import UIKit

class TableViewDetail: UIViewController{
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var nombreDetail: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var evolucion: UILabel!
    @IBOutlet weak var tipo: UILabel!
    @IBOutlet weak var informacion: UILabel!
    var selectedShapPoke : PokeShape!
    override func viewDidLoad() {
            super.viewDidLoad()
        // Configura el estado del botón de favoritos según el elemento
                if selectedShapPoke.isFavorite {
                    favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                } else {
                    favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
                }

                // Configura el manejador de eventos para el botón de favoritos
                favoriteButton.addTarget(self, action: #selector(toggleFavoriteButton), for: .touchUpInside)
            
        nombreDetail.text = selectedShapPoke.id + " - " + selectedShapPoke.name
        imageDetail.image = UIImage(named: selectedShapPoke.imageName)
        if(selectedShapPoke.id == "001"){
            evolucion.text = "Venusaur"
            tipo.text = "Planta/Veneno"
            informacion.text = "Un pokemon tipo planta que parece una rana, sus semillas brotan de su espalda "
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "004"){
            evolucion.text = "Charizard"
            tipo.text = "Fuego"
            informacion.text = "Un pokemon tipo fuego que parece una lagartija, su cola siempre esta ardiendo "
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "007"){
            evolucion.text = "Blastoise"
            tipo.text = "Agua"
            informacion.text = "Un pokemon tipo agua que parece una tortuga, su cuerpo es una capa fuerte"
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "013"){
            evolucion.text = "Beedrill"
            tipo.text = "Veneno"
            informacion.text = "Un pokemon tipo veneno que se alimenta de hojas oculto en la espesura de bosques y praderas"
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "023"){
            evolucion.text = "Arbok"
            tipo.text = "Veneno"
            informacion.text = "Un pokemon tipo veneno que puede desencajar la mandíbula libremente para engullir grandes presas"
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "025"){
            evolucion.text = "Raichu"
            tipo.text = "Rayo"
            informacion.text = "Un pokemon tipo rayo que descarga la energía que almacena en el interior de las bolsas de las mejillas"
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "029"){
            evolucion.text = "Nidoqueen"
            tipo.text = "Veneno"
            informacion.text = "Un pokemon tipo veneno que parece usa los bigotes para buscar comida a sotavento de sus depredadores"
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "032"){
            evolucion.text = "Nidoking"
            tipo.text = "Veneno"
            informacion.text = "Un pokemon tipo veneno que si advierte peligro, ataca inoculando una potente toxina con su cuerno frontal"
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "037"){
            evolucion.text = "Ninetales"
            tipo.text = "Fuego"
            informacion.text = "Un pokemon tipo fuego que finge estar herido para confundirlo y huir en cuanto baja la guardia"
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "041"){
            evolucion.text = "Golbat"
            tipo.text = "Veneno"
            informacion.text = "Un pokemon tipo veneno que emite ondas ultrasónicas por la boca para escrutar el entorno"
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "043"){
            evolucion.text = "Vileplume"
            tipo.text = "Planta/Veneno"
            informacion.text = "Un pokemon tipo planta que puede llegar a desplazarse hasta 300 m con sus dos raíces "
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "054"){
            evolucion.text = "Golduck"
            tipo.text = "Agua"
            informacion.text = "Un pokemon tipo agua que padece continuamente dolores de cabeza y lo vuelve muy poderoso"
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "058"){
            evolucion.text = "Arcanine"
            tipo.text = "Fuego"
            informacion.text = "Un pokemon tipo fuego que se enfrenta sin miedo a enemigos más grandes y fuertes"
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "069"){
            evolucion.text = "Victreebel"
            tipo.text = "Planta/Veneno"
            informacion.text = "Un pokemon tipo planta que reacciona enseguida extendiendo sus finas lianas en esa dirección"
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "077"){
            evolucion.text = "Rapidash"
            tipo.text = "Fuego"
            informacion.text = "Un pokemon tipo fuego que después de nacer, surgen grandes características que le confieren un aspecto magnífico"
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "081"){
            evolucion.text = "Magneton"
            tipo.text = "Rayo"
            informacion.text = "Un pokemon tipo rayo cuyas unidades laterales crean ondas electromagnéticas que le permiten flotar "
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "088"){
            evolucion.text = "Muk"
            tipo.text = "Veneno"
            informacion.text = "Un pokemon tipo veneno que con otros grimer se juntan en lugares sucios para aumentar el número de gérmenes de su cuerpo"
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "090"){
            evolucion.text = "Cloyster"
            tipo.text = "Agua"
            informacion.text = "Un pokemon tipo agua que está metido en una concha más dura que el diamante con un cuerpo blando"
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "102"){
            evolucion.text = "Exeggutor"
            tipo.text = "Planta"
            informacion.text = "Un pokemon tipo planta que si alguien confunde a una de sus cabezas con un huevo y la toca, game over"
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "109"){
            evolucion.text = "Weezing"
            tipo.text = "Veneno"
            informacion.text = "Un pokemon tipo veneno que encierra gases muy tóxicos que pueden ocasionar explosiones espontáneas"
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "145"){
            evolucion.text = "Moltres"
            tipo.text = "Rayo"
            informacion.text = "Un pokemon tipo rayo que vive en los nubarrones y controla los rayos a su antojo "
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "150"){
            evolucion.text = "Cyndaquil"
            tipo.text = "Fuego"
            informacion.text = "Un pokemon tipo planta que parece una rana, sus semillas brotan de su espalda "
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
    }
    @objc func toggleFavoriteButton() {
        // Cambia el estado de favorito
        selectedShapPoke.isFavorite.toggle()

        // Actualiza el estado del botón de favoritos
        let heartImage = selectedShapPoke.isFavorite ? "heart.fill" : "heart"
        favoriteButton.setImage(UIImage(systemName: heartImage), for: .normal)

        // Agrega o quita el elemento de la lista de favoritos en DataManager
        if selectedShapPoke.isFavorite {
            DataManager.shared.favoriteItems.append(selectedShapPoke)
        } else {
            DataManager.shared.favoriteItems.removeAll { $0.id == selectedShapPoke.id }
        }

        // Guarda la lista de favoritos en UserDefaults
        DataManager.shared.saveFavorites()

        // Puedes publicar una notificación para informar a otras partes de la aplicación que los favoritos han sido actualizados
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "FavoritesUpdated"), object: nil)
    }
}
