//
//  CountriesViewController.swift
//  CountryCurrencyApp
//
//  Created by Diplomado on 08/06/24.
//

import UIKit

class CountriesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    var countries: [Country] = []
    var flags: [Flag] = []
    var countryDetails: [CountryDetail] = []
    var capitals: [Capital] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Countries"
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(CountryCell.self, forCellWithReuseIdentifier: "CountryCell")
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        self.view.addSubview(collectionView)
        
        loadCountries()
        loadCountryDetails()
        loadFlags()
        loadCapitals() // Cargar los estados
    }
    
    func loadCountries() {
        if let url = Bundle.main.url(forResource: "Countries", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                countries = try JSONDecoder().decode([Country].self, from: data)
                collectionView.reloadData()
            } catch {
                print("Error loading countries: \(error)")
            }
        }
    }
    
    func loadFlags() {
        if let url = Bundle.main.url(forResource: "Flags", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let flagDict = try JSONDecoder().decode([String: String].self, from: data)
                flags = flagDict.map { (key: String, value: String) -> Flag in
                    Flag(pais: key, codigo: value)
                }
            } catch {
                print("Error loading flags: \(error)")
            }
        }
    }

func loadCountryDetails() {
    if let url = Bundle.main.url(forResource: "CountryDetails", withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            countryDetails = try JSONDecoder().decode([CountryDetail].self, from: data)
        } catch {
            print("Error loading country details: \(error)")
        }
    }
}

func loadCapitals() {
    if let url = Bundle.main.url(forResource: "Capitals", withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let jsonObject = try JSONDecoder().decode([[String: [State]]].self, from: data)
                print(jsonObject)
            if let countries = jsonObject.first {
                var states = [Capital]()
                for country in countries {
                    let countryName = country.key
                    var regions = [String]()
                    for region in country.value {
                        regions.append(region.estado)
                    }
                    states.append(Capital(pais: countryName, states: regions))
                }
                capitals = states
            }
                
        } catch {
            print("Error loading capitals: \(error)")
        }
    }
}

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return flags.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CountryCell", for: indexPath) as? CountryCell else { fatalError("Error when dequeuing custom cell") }
    cell.update(with: flags[indexPath.row])
    return cell
}

func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let country = flags[indexPath.row]
    let detailVC = CountryDetailViewController()
    detailVC.country = country
    if let detail = countryDetails.first(where: { $0.nombre == country.pais }) {
        detailVC.countryDetail = detail
    }
    if let capital = capitals.first(where: { $0.pais == country.pais }) {
        detailVC.states = capital.states
    }
    navigationController?.pushViewController(detailVC, animated: true)
}


func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = (collectionView.frame.width - 40) / 2
    return CGSize(width: width, height: width)
}
}




