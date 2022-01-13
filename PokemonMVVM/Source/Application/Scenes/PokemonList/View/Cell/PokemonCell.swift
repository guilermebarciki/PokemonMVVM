//
//  PokemonCell.swift
//  PokemonMVVM
//
//  Created by Guilerme Barciki on 11/01/22.
//

import Foundation
import UIKit

final class PokemonCell: UITableViewCell {
    lazy var pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    lazy var pokemonImage: UIImage = {
        let image = UIImage()
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        constraintSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        contentView.addSubview(pokemonNameLabel)
    }
    
    func constraintSubviews() {
        NSLayoutConstraint.activate([
            pokemonNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            pokemonNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            pokemonNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            pokemonNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
    
    // MARK: - Internal API
    
    func configure(pokemonName: String) {
        pokemonNameLabel.text = pokemonName
    }
}
