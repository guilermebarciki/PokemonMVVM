//
//  File.swift
//  PokemonMVVM
//
//  Created by Guilerme Barciki on 11/01/22.
//

import Foundation

struct ApiResult: Decodable {
    let results: [Pokemon]?
}

struct ApiDetailResult: Decodable {
    let sprites: ApiSprites
}

struct ApiSprites: Decodable {
//    let other: [Sprites]?
    let other: [String:Sprites]?
}

struct Sprites: Decodable {
    let home: [String:PokemonImage]?
    // let home: PokemonImage?
}

struct PokemonImage: Decodable {
    let front_default: URL?
}
