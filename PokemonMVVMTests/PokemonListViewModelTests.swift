//
//  PokemonListViewModelTests.swift
//  PokemonMVVMTests
//
//  Created by Guilerme Barciki on 12/01/22.
//

import Foundation
import XCTest
@testable import PokemonMVVM

final class PokemonListViewModelTests: XCTestCase {
    
    private lazy var sut = PokemonListViewModel(service: mock)
    private let mock = PokemonListServiceMock()
    func test_numberOfPokemons_whenLoading_properlymatches() {
        let expectedItemCount = Int.random(in: 10...1000)
        mock.resultToUse = .success(.init(
            results: .init(repeating: .init(name: "kkk", url: URL(string: ""), pokemonImage: URL(string: "")), count: expectedItemCount)))
        sut.loadPokemons()
        
        let actualItemCount = sut.numberOfRows()
        
        XCTAssertEqual(expectedItemCount, actualItemCount)
    }
}

final class PokemonListServiceMock: ApiServiceProtocol {
    
    var resultToUse: Result<ApiResult, ApiError> = .failure(.parsing)
    func loadPokemons(for url: URL, completion: @escaping (Result<ApiResult, ApiError>) -> Void) {
        completion(resultToUse)
    }
    
    
}
