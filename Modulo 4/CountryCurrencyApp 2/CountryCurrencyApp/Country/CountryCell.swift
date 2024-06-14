//
//  CountryCell.swift
//  CountryCurrencyApp
//
//  Created by Diplomado on 08/06/24.
//

import UIKit

class CountryCell: UICollectionViewCell {
    
    let nameLabel = UILabel()
    let flagImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 10
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        
        constraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func constraints() {
        [flagImageView, nameLabel].forEach{self.contentView.addSubview($0)}
        
        NSLayoutConstraint.activate([
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            
            flagImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            flagImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            flagImageView.widthAnchor.constraint(equalToConstant: 50),
            flagImageView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func update(with data: Flag) {
        nameLabel.text = data.pais
        flagImageView.image = UIImage(named: data.codigo)
    }
}


