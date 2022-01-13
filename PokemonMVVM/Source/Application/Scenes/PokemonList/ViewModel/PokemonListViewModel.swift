//
//  PokemonListViewModel.swift
//  PokemonMVVM
//
//  Created by Guilerme Barciki on 11/01/22.
//

import Foundation

class PokemonListViewModel: PokemonListViewModelProtocol {
    
    private var pokemonList: [Pokemon] = []
    private var currentURL = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151&offset=0" )!
    private let service = ApiService()
    weak var delegate: PokemonListViewModelDelegate?
    
    func loadPokemons() {
        service.loadPokemons(for: currentURL) { result in
            switch result {
            case let .success(apiResult):
                self.pokemonList = apiResult.results ?? []
                self.delegate?.reloadData()
            case let .failure(error):
                break //TODO mostrar erro
            }
        }
        
//        print("load pokemons")
//
//        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151&offset=0" ) else {
//            print("url error")
//            return
//        }
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            print("load pokemons")
//            guard let data = data else {
//                // TODO handle error
//                return
//            }
//            guard let apiResult = try? JSONDecoder().decode(ApiResult.self, from: data) else {
//                //TODO handke decoding error
//                return
//            }
//            self.pokemonList = apiResult.results ?? []
//            print(self.pokemonList)
//
//            DispatchQueue.main.async {
//                self.delegate?.reloadData()
//                self.teste()
//            }
//
//        }.resume()
        //
       
        //
    }
    
    func teste() {
        for pokemon in self.pokemonList {
            
            guard let url2 = pokemon.url else {
                print("url error")
                return
            }
            URLSession.shared.dataTask(with: url2) { data, response, error in
                guard let data = data else {
                    print("error data")
                    return
                }
                print(url2)
                guard let apiResult = try? JSONDecoder().decode(ApiDetailResult.self, from: data) else {
                    print("error json")
                    return
                }
                
                
                //print(apiResult)
    //            let sprites: [ApiSprites] = apiResult.sprites
    //            print ("*** sprites :  \(sprites)")
                
//                pokemon.pokemonImage = apiResult.sprites.other["home"]?.front_default
                
                
                pokemon.pokemonImage = self.getJson(data: data,  pokemon: pokemon)
                
            }.resume()
        }
    }
    
    func getJson(data: Data?, pokemon: Pokemon) -> URL? {
        do {
            let pokemonJson = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as? NSDictionary
            if let pokemonAtributes = pokemonJson {
                let sprites = pokemonAtributes["sprites"] as! NSDictionary
                let other = sprites["other"] as! NSDictionary
                print(other)
                let officialArtwork = other["official-artwork"] as? NSDictionary
                let image = officialArtwork?["front_default"] as? String
                print(image)
                return URL(string: image!)
                
            }
        } catch _ {
            
        }
        return nil
    }
    
    func numberOfSection() -> Int {
        1
    }
    
    func numberOfRows() -> Int {
        pokemonList.count
    }
    
    func transporter(indexPath: IndexPath) -> String {
       
        pokemonList[indexPath.row].name ?? "nulo"
          
        
    }
    
    func showPokemon(pokemon: String) {
        //
    }
    
    
}
