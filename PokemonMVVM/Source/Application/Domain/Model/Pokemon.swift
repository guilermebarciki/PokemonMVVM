//
//  Pokemon.swift
//  PokemonMVVM
//
//  Created by Guilerme Barciki on 11/01/22.
//

import Foundation

struct Pokemon: Decodable {

    var name: String?
    var url: URL?
    var pokemonImage: URL?
    
    
    
    mutating func setImage(url: String) {
        pokemonImage = URL(string: url)
    }
}
