//
//  PokemonListViewController.swift
//  PokemonMVVM
//
//  Created by Guilerme Barciki on 11/01/22.
//

import Foundation
import UIKit

final class PokemonListViewController: UIViewController {
    // MARK: - Properties
    
    private let viewModel = PokemonListViewModel()
    private lazy var pokemonTableView = PokemonListView()
    
    // MARK: - ViewController lifecycle
    override func loadView() { //sobrecarga do método porque a lista ficará na tela
            view = pokemonTableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonTableView.bind(dataSource: self)
        viewModel.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.loadPokemons()
    }
}

extension PokemonListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell") as? PokemonCell else {
            fatalError("no cell registered")
        }
        let pokemonName = viewModel.transporter(indexPath: indexPath)
        cell.configure(pokemonName: pokemonName)
        return cell
    }
    
    
}

extension PokemonListViewController:  PokemonListViewModelDelegate {
    func reloadData() {
        pokemonTableView.reloadData()
    }   
}


