//
//  ViewController.swift
//  MoviesCollection
//
//  Created by Diplomado on 25/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableViewMoviesList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewMoviesList.dataSource = self
        tableViewMoviesList.delegate = self
        tableViewMoviesList.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCellGenre")
        
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Netflix App"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayMovies.count // Aquí se listan los generos
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellGenre") as! CustomTableViewCell
        
        cell.titleGenreMoviesLabel?.text = arrayMovies[indexPath.row].nameGenre
        cell.arrayPeliculas = arrayMovies[indexPath.row].movies
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250.0
    }
}
