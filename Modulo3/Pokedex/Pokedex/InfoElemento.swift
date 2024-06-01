//
//  InfoElemento.swift
//  Pokedex
//
//  Created by Diplomado on 31/05/24.
//

import Foundation
import UIKit
class InfoElemento : UIViewController{
    
    @IBOutlet weak var mitaddanio: UILabel!
    @IBOutlet weak var Dobledanio: UILabel!
    @IBOutlet weak var NolehaceDanio: UILabel!
    @IBOutlet weak var danioLabel: UILabel!
    @IBOutlet weak var mitadDanA: UILabel!
    @IBOutlet weak var mitadDanDE: UILabel!
    
    
    var ArrayElementos: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(ArrayElementos == "planta"){
            Dobledanio.text = "Fuego, Hielo, Veneno"
            NolehaceDanio.text = "Ninguno"
            danioLabel.text = "Agua, Tierra, Roca"
            mitaddanio.text = "Ninguno"
            mitadDanA.text = "Agua, Planta, Rayo"
            mitadDanDE.text = "Agua, Planta, Tierra"
        }
        else if(ArrayElementos == "agua"){
            Dobledanio.text = "Rayo, Planta"
            NolehaceDanio.text = "Ninguno"
            danioLabel.text = "Fuego, Tierra, Roca"
            mitaddanio.text = "Ninguno"
            mitadDanA.text = "Fuego, Agua, Roca"
            mitadDanDE.text = "Fuego, Agua, Hielo"
        }else if (ArrayElementos == "Fuego"){
            Dobledanio.text = "Agua, Tierra, Roca"
            NolehaceDanio.text = "Ninguno"
            danioLabel.text = "Planta, Hielo, Bicho"
            mitaddanio.text = "Ninguno"
            mitadDanA.text = "Fuego, Agua, Roca"
            mitadDanDE.text = "Fuego, Planta, Hielo"
        }else if(ArrayElementos == "rayo"){
            Dobledanio.text = "Tierra"
            NolehaceDanio.text = "Tierra"
            danioLabel.text = "Agua, Volador"
            mitaddanio.text = "Tierra"
            mitadDanA.text = "Planta, Rayo"
            mitadDanDE.text = "Rayo, Volador, Acero"
        }
        else if(ArrayElementos == "veneno"){
            Dobledanio.text = "Tierra, Psiquico"
            NolehaceDanio.text = "Ninguno"
            danioLabel.text = "Planta, Hada"
            mitaddanio.text = "Acero"
            mitadDanA.text = "Planta, Lucha, Veneno"
            mitadDanDE.text = "Planta, Lucha, Veneno"
        }
    }
}
