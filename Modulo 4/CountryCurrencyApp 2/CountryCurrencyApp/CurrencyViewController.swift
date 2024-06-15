//
//  CurrencyViewController.swift
//  CountryCurrencyApp
//
//  Created by Diplomado on 08/06/24.
//

import UIKit

struct ExchangeRate: Codable {
    let rates: [String: [Double]]
}

class CurrencyViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let fromPicker = UIPickerView()
    let toPicker = UIPickerView()
    let direction = UILabel()
    let amountTextField = UITextField()
    let resultLabel = UILabel()
    
    private var isRightDirection: Bool = true
    
    var currencies: [String] = []
    var exchangeRates: [CurrencyConversionDTO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Currency Conversion"
        view.backgroundColor = .white
        setupPickers()
        setupDirectionLabel()
        addActionRightLabel()
        setupTextField()
        setupResultLabel()
        setupConvertButton()
        loadCurrency()
        loadCurrencyConversion()
    }
    
    func loadExchangeRates(for currency: String)  {
        if let url = Bundle.main.url(forResource: "CurrencyConversion", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let exchangeRateData = try JSONDecoder().decode([[String: [String: Double]]].self, from: data)
                for currencyConversion in exchangeRateData {
                    for (currency, rates) in currencyConversion {
                        let dto = CurrencyConversionDTO(currency: currency, rates: rates)
                        if dto.currency == currency {
                            print(dto)
                        }
                    }
                }
            } catch {
                print("Error loading exchange rates: \(error)")
            }
        }
    }
    
    func setupDirectionLabel() {
        direction.text = ">"
        direction.translatesAutoresizingMaskIntoConstraints = false
        direction.textAlignment = .center
        
        view.addSubview(direction)
        
        NSLayoutConstraint.activate([
            direction.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            direction.leftAnchor.constraint(equalTo: fromPicker.leftAnchor, constant: 16),
            direction.rightAnchor.constraint(equalTo: toPicker.rightAnchor, constant: -16)
        ])
    }
    
    func addActionRightLabel() {
        direction.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(changeDirection))
        direction.addGestureRecognizer(tapGesture)
    }
    
    @objc func changeDirection() {
        isRightDirection.toggle()
        direction.text = isRightDirection ? ">" : "<"
    }
    
    func setupPickers() {
        fromPicker.delegate = self
        fromPicker.dataSource = self
        toPicker.delegate = self
        toPicker.dataSource = self
        
        fromPicker.translatesAutoresizingMaskIntoConstraints = false
        toPicker.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(fromPicker)
        view.addSubview(toPicker)
        
        NSLayoutConstraint.activate([
            fromPicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            fromPicker.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            fromPicker.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
            
            toPicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            toPicker.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            toPicker.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
    
    func setupTextField() {
        amountTextField.translatesAutoresizingMaskIntoConstraints = false
        amountTextField.borderStyle = .roundedRect
        amountTextField.keyboardType = .decimalPad
        amountTextField.placeholder = "Enter amount"
        
        view.addSubview(amountTextField)
        
        NSLayoutConstraint.activate([
            amountTextField.topAnchor.constraint(equalTo: fromPicker.bottomAnchor, constant: 20),
            amountTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            amountTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
    
    func setupResultLabel() {
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.textAlignment = .center
        
        view.addSubview(resultLabel)
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 20),
            resultLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            resultLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
    
    func setupConvertButton() {
        let convertButton = UIButton(type: .system)
        convertButton.setTitle("Convert", for: .normal)
        convertButton.addTarget(self, action: #selector(convertTapped), for: .touchUpInside)
        
        convertButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(convertButton)
        
        NSLayoutConstraint.activate([
            convertButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20),
            convertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func convertTapped() {
        guard let amountText = amountTextField.text, let amount = Double(amountText) else { return }
        
        let fromCurrency = currencies[fromPicker.selectedRow(inComponent: 0)]
        let toCurrency = currencies[toPicker.selectedRow(inComponent: 0)]
        
        if direction.text == ">" {
            let result = convert(amount: amount, from: fromCurrency, to: toCurrency)
            resultLabel.text = String(format: "%.2f \(toCurrency)", result!)
        } else if direction.text == "<" {
            let result = convert(amount: amount, from: toCurrency , to: fromCurrency)
            resultLabel.text = String(format: "%.2f \(toCurrency)", result!)
        }
        
        
    }
    
    func convert(amount: Double, from: String, to: String) -> Double? {
        guard let rateForCurrency = exchangeRates.first(where: { currency in
            from.contains(currency.currency)
        }) else { return nil }
        
        print(rateForCurrency)
        
        guard let rates = rateForCurrency.rates.first(where: { (country: String, rate: Double) in
            to.contains(country)
        }) else { return nil}
        
        let rate = rates.value
        print(rate)
        
        
        return amount * rate
    }
    
    func loadCurrencyConversion() {
        guard let url = Bundle.main.url(forResource: "CurrencyConversion", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode([[String: [String: Double]]].self, from: data) else { return }
        
        print(decoded)
        
        for currencyConversion in decoded {
            for (currency, rates) in currencyConversion {
                let dto = CurrencyConversionDTO(currency: currency, rates: rates)
                exchangeRates.append(dto)
            }
        }
        
        print(exchangeRates)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencies[row]
    }
}


extension CurrencyViewController {
    func loadCurrency() {
        if let url = Bundle.main.url(forResource: "Currency", withExtension: "json") {
            guard let data = try? Data(contentsOf: url),
                  let decoded = try? JSONDecoder().decode([CurrencyDTO].self, from: data) else { return }
            currencies = decoded.map { $0.moneda }
            fromPicker.reloadAllComponents()
            toPicker.reloadAllComponents()
        }
    }
}
