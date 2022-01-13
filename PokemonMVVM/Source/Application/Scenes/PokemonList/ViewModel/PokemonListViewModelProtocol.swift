//
//  PokemonListViewModelProtocol.swift
//  PokemonMVVM
//
//  Created by Guilerme Barciki on 11/01/22.
//

import Foundation

protocol PokemonListViewModelProtocol: AnyObject {
    func loadPokemons()
    func numberOfSection() -> Int
    func numberOfRows() -> Int
    func transporter(indexPath: IndexPath) -> String
    func showPokemon(pokemon: String)
}

protocol PokemonListViewModelDelegate: AnyObject {
    func reloadData()
}
