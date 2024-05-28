//
//  CustomTableViewCell.swift
//  MoviesCollection
//
//  Created by Diplomado on 25/05/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleGenreMoviesLabel: UILabel!
    @IBOutlet weak var listMoviesCollectionView: UICollectionView!

    var arrayPeliculas: [Movies] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        listMoviesCollectionView.dataSource = self
        
        listMoviesCollectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCellMovies")
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension CustomTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayPeliculas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCellMovies", for: indexPath) as! CustomCollectionViewCell
        
        cell.movieImageView.image = UIImage(named: arrayPeliculas[indexPath.row].imageMovie)
        
        return cell
    }
}

