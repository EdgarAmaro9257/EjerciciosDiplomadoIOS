//
//  CountryPointsOfInterestsViewController.swift
//  CountryCurrencyApp
//
//  Created by Manuel Salazar on 6/11/24.
//

import UIKit

class CountryPointsOfInterestsViewController: UITableViewController {
    private var dataSource: UITableViewDiffableDataSource<Int, String>!
    var poi: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataSource()
        applySnapshot(with: poi)
    }
    
}

private extension CountryPointsOfInterestsViewController {
    func setupDataSource() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tablecell2")
        dataSource = UITableViewDiffableDataSource(tableView: tableView) { tableView, indexPath, state in
            let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell2", for: indexPath)
            cell.textLabel?.text = state
            return cell
        }
    }
    
    func applySnapshot(with data: [String]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
        snapshot.appendSections([0])
        snapshot.appendItems(data)
        dataSource.apply(snapshot)
    }
}
