//
//  APIService.swift
//  PokemonMVVM
//
//  Created by Guilerme Barciki on 12/01/22.
//

import Foundation

enum ApiError: Error {
    case apiError
    case parsing
}

protocol ApiServiceProtocol {
    func loadPokemons(for url: URL, completion: @escaping (Result<ApiResult, ApiError>) -> Void)
}

class ApiService: ApiServiceProtocol {
    func loadPokemons(for url: URL, completion: @escaping (Result<ApiResult, ApiError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
           
            DispatchQueue.main.async {
                print("load pokemons")
                guard let data = data else {
                    completion(.failure(ApiError.apiError))
                    return
                }
                guard let apiResult = try? JSONDecoder().decode(ApiResult.self, from: data) else {
                    completion(.failure(ApiError.parsing))
                    return
                }
                completion(.success(apiResult))
            }
            
        }.resume()
    }
}
