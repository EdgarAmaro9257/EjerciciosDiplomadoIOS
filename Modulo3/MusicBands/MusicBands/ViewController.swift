//
//  ViewController.swift
//  MusicBands
//
//  Created by Diplomado on 18/05/24.
//

import UIKit
import Foundation

struct Song {
    let name: String
    let duration: String
}

struct Album {
    let title: String
    let releaseYear: String
    let songs: [Song]
}

struct Band {
    let name: String
    let albums: [Album]
}


class BandsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var bands: [Band] = [
        Band(name: "The Beatles", albums: [
            Album(title: "Abbey Road", releaseYear: "1969", songs: [
                Song(name: "Come Together", duration: "4:19"),
                Song(name: "Something", duration: "3:03"),
                Song(name: "Octopus's Garden", duration: "2:51")
            ]),
            Album(title: "Let It Be", releaseYear: "1970", songs: [
                Song(name: "Let It Be", duration: "4:03"),
                Song(name: "Across the Universe", duration: "3:48"),
                Song(name: "The Long and Winding Road", duration: "3:38")
            ])
        ]),
        Band(name: "Led Zeppelin", albums: [
            Album(title: "Led Zeppelin II", releaseYear: "1969", songs: [
                Song(name: "Whole Lotta Love", duration: "5:34"),
                Song(name: "Heartbreaker", duration: "4:14"),
                Song(name: "Ramble On", duration: "4:34")
            ]),
            Album(title: "Led Zeppelin IV", releaseYear: "1971", songs: [
                Song(name: "Stairway to Heaven", duration: "8:02"),
                Song(name: "Black Dog", duration: "4:55"),
                Song(name: "Rock and Roll", duration: "3:40")
            ])
        ])
           
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bands"
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension BandsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bands.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bandCell", for: indexPath)
        let band = bands[indexPath.row]
        cell.textLabel?.text = band.name
        return cell
    }
}

// MARK: - UITableViewDelegate
extension BandsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let exampleViewController = storyboard.instantiateViewController(withIdentifier: "AlbumsViewController") as? AlbumsViewController {
                    navigationController?.pushViewController(exampleViewController, animated: true)
                    exampleViewController.band = bands[indexPath.row]
                }
    }
}


