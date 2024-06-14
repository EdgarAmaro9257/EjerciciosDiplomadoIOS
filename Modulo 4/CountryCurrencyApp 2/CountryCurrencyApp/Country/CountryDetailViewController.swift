//
//  CountryDetailViewController.swift
//  CountryCurrencyApp
//
//  Created by Diplomado on 08/06/24.
//

import UIKit

class CountryDetailViewController: UIViewController {
    
    var country: Flag!
    var countryDetail: CountryDetail!
    var states: [String] = []
    var pointsOfInterests: [String] = []
    
    
    let nameLabel = UILabel()
    let flagImageView = UIImageView()
    let capitalLabel = UILabel()
    let languageLabel = UILabel()
    let currencyLabel = UILabel()
    
    let table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private var dataSource: UITableViewDiffableDataSource<Int, String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupDataSource()
        
        table.delegate = self
        
        nameLabel.text = "Nombre: \(country.pais)"
        capitalLabel.text = "Capital: \(countryDetail.capital)"
        languageLabel.text = "Idioma: \(countryDetail.idioma)"
        
        flagImageView.image = UIImage(named: country.codigo)
        flagImageView.contentMode = .scaleAspectFit
        
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, flagImageView, capitalLabel, languageLabel, currencyLabel, table])
        stackView.axis = .vertical
        stackView.spacing = 10
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            flagImageView.heightAnchor.constraint(equalToConstant: 100),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
        
        applySnapshot(with: states)
        loadCurrency()
        addActionToCurrencyLabel()
    }
    
    func loadPointsOfInterests(for state: String) {
        if let url = Bundle.main.url(forResource: "PointsOfInterest", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let jsonDecoded = try JSONDecoder().decode(PointsOfInterestDTO.self, from: data)
                for paises in jsonDecoded.Paises {
                    guard let pais = paises.first(where: { $0.key == country.pais }),
                          let poi = pais.value.first(where: { $0.estado ==  state })  else { return }
                    pointsOfInterests = poi.lugares
                }
            } catch {
                print("Error loading country details: \(error)")
            }
        }
    }
    
    func loadCurrency() {
        if let url = Bundle.main.url(forResource: "Currency", withExtension: "json") {
            guard let data = try? Data(contentsOf: url),
                  let decoded = try? JSONDecoder().decode([CurrencyDTO].self, from: data),
                  let pais = decoded.first(where: { $0.nombre == country.pais })  else { return }
            currencyLabel.text = pais.moneda
        }
    }
    
    private func setupDataSource() {
        table.register(UITableViewCell.self, forCellReuseIdentifier: "tablecell")
        dataSource = UITableViewDiffableDataSource(tableView: table) { tableView, indexPath, state in
            let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath)
            cell.textLabel?.text = state
            return cell
        }
    }
    
    private func addActionToCurrencyLabel() {
        currencyLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        currencyLabel.addGestureRecognizer(tapGesture)
    }
    
    
    @objc func labelTapped() {
        print("Currency tapped")
        NotificationCenter.default.post(name: .currencyTapped, object: nil)
        
    }
    
    private func applySnapshot(with data: [String]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
        snapshot.appendSections([0])
        snapshot.appendItems(data)
        dataSource.apply(snapshot)
    }
}

extension CountryDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(states[indexPath.row])
        print(country.pais)
        loadPointsOfInterests(for: states[indexPath.row])
        let vc = CountryPointsOfInterestsViewController()
        vc.poi = pointsOfInterests
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
