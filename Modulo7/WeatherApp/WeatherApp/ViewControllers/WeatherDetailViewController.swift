//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by Diplomado on 03/08/24.
//

import UIKit
import MapKit

class WeatherDetailViewController: UIViewController {
    var location: Location?
    private var weather: Weather?
    private var isFavorite = false
    
    private let mapView = MKMapView()
    private let temperatureLabel = UILabel()
    private let uvIndexLabel = UILabel()
    private let favoriteButton = UIBarButtonItem()
    private let segmentedControl = UISegmentedControl(items: ["C", "F"])
    private let lastUpdateLabel = UILabel()
    private let weatherIconImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchWeather()
        updateFavoriteStatus()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.title = location?.nombre
        navigationItem.rightBarButtonItem = favoriteButton
        
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        uvIndexLabel.translatesAutoresizingMaskIntoConstraints = false
        lastUpdateLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherIconImageView.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(segmentedControlChanged), for: .valueChanged)
        
        view.addSubview(temperatureLabel)
        view.addSubview(uvIndexLabel)
        view.addSubview(lastUpdateLabel)
        view.addSubview(weatherIconImageView)
        view.addSubview(segmentedControl)
        view.addSubview(mapView)
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            temperatureLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            uvIndexLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 20),
            uvIndexLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            weatherIconImageView.topAnchor.constraint(equalTo: uvIndexLabel.bottomAnchor, constant: 20),
            weatherIconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherIconImageView.widthAnchor.constraint(equalToConstant: 50),
            weatherIconImageView.heightAnchor.constraint(equalToConstant: 50),
            
            lastUpdateLabel.topAnchor.constraint(equalTo: weatherIconImageView.bottomAnchor, constant: 20),
            lastUpdateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mapView.topAnchor.constraint(equalTo: lastUpdateLabel.bottomAnchor, constant: 20),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        setupFavoriteButton()
    }
    
    private func setupFavoriteButton() {
        let starImage = UIImage(systemName: "star")
        let starFillImage = UIImage(systemName: "star.fill")
        favoriteButton.image = isFavorite ? starFillImage : starImage
        favoriteButton.target = self
        favoriteButton.action = #selector(toggleFavorite)
    }
    
    private func updateFavoriteStatus() {
        guard let location = location else { return }
        isFavorite = UserDefaultsManager().getFavorites().contains(where: { $0.id == location.id })
        setupFavoriteButton()
    }
    
    @objc private func toggleFavorite() {
        guard let location = location else { return }
        let userDefaultsManager = UserDefaultsManager()
        if isFavorite {
            userDefaultsManager.removeFavorite(location: location)
        } else {
            userDefaultsManager.saveFavorite(location: location)
        }
        isFavorite.toggle()
        setupFavoriteButton()
    }
    
    @objc private func segmentedControlChanged(_ sender: UISegmentedControl) {
        updateTemperature()
    }
    
    private func fetchWeather() {
        guard let locationName = location?.nombre else { return }
        
        NetworkManager.shared.fetchWeather(for: locationName) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let weatherData):
                    self?.weather = weatherData
                    self?.updateUI()
                case .failure(let error):
                    print("Error fetching weather: \(error)")
                }
            }
        }
    }
    
    private func updateUI() {
        guard let weather = weather else { return }
        temperatureLabel.text = "Temperatura: \(weather.current.temp_c)°C"
        uvIndexLabel.text = "Índice UV: \(weather.current.uv)"
        
        let isDay = weather.current.is_day == 1
        view.backgroundColor = isDay ? UIColor(hex: "#87CEEB") : UIColor(hex: "#191970")
        
        let latitude = weather.location.lat
        let longitude = weather.location.lon
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(region, animated: true)
        
        if let iconUrl = URL(string: "https://example.com/icons/\(weather.current.condition.icon).png") {
            let task = URLSession.shared.dataTask(with: iconUrl) { [weak self] data, _, _ in
                guard let data = data, let image = UIImage(data: data) else { return }
                DispatchQueue.main.async {
                    self?.weatherIconImageView.image = image
                }
            }
            task.resume()
        }
        
        lastUpdateLabel.text = "Última actualización: \(weather.location.localtime)"
    }
    
    private func updateTemperature() {
        guard let weather = weather else { return }
        let temperature = segmentedControl.selectedSegmentIndex == 0 ? weather.current.temp_c : weather.current.temp_f
        temperatureLabel.text = "Temperatura: \(temperature)°"
    }
}

extension UIColor {
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        var hexInt = UInt64()
        Scanner(string: hex).scanHexInt64(&hexInt)
        let red = CGFloat((hexInt >> 16) & 0xFF) / 255.0
        let green = CGFloat((hexInt >> 8) & 0xFF) / 255.0
        let blue = CGFloat(hexInt & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}



