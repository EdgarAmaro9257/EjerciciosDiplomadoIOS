//
//  ViewController.swift
//  RGBColors
//
//  Created by Diplomado on 06/04/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Configurar los valores predeterminados
        redSlider.value = 0.0
        greenSlider.value = 0.0
        blueSlider.value = 0.0
        updateBackgroundColor()
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        updateBackgroundColor()
    }

    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // Resetear los valores de los sliders y actualizar el color de fondo
        redSlider.value = 0.0
        greenSlider.value = 0.0
        blueSlider.value = 0.0
        updateBackgroundColor()
    }

    func updateBackgroundColor() {
        // Obtener los valores de los sliders
        let redValue = CGFloat(redSlider.value)
        let greenValue = CGFloat(greenSlider.value)
        let blueValue = CGFloat(blueSlider.value)

        // Actualizar los labels con los valores actuales de los sliders
        redLabel.text = "\(Int(redValue * 255))"
        greenLabel.text = "\(Int(greenValue * 255))"
        blueLabel.text = "\(Int(blueValue * 255))"

        // Actualizar el color de fondo de la vista
        view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
}







