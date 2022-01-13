//
//  PokemonListView.swift
//  PokemonMVVM
//
//  Created by Guilerme Barciki on 11/01/22.
//

import UIKit

final class PokemonListView: UIView {
    
    // MARK: - UI Components
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.register(PokemonCell.self, forCellReuseIdentifier: "PokemonCell")
        
        return view
    }()
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        constraintSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Lifecycle
    
    func addSubviews() {
        print("add tableview")
        addSubview(tableView)
        
    }
    
    func constraintSubviews() {
        print("setou constraint")
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    // MARK: - Internal API

    func bind(dataSource: UITableViewDataSource) {
        tableView.dataSource = dataSource
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}


