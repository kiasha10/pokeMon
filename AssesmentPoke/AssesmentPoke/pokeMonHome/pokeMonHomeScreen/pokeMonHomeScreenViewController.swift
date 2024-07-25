//
//  pokeMonHomeScreenViewController.swift
//  AssesmentPoke
//
//  Created by Kiasha Rangasamy on 2024/07/23.
//

import UIKit

class PokemonHomeScreenViewController: UIViewController {
    
    // MARK: IBOulets
    
    @IBOutlet weak var tableView: UITableView!

    private lazy var viewModel = PokemonHomeScreenViewModel (repository: PokemonHomeScreenRepository(), delegate: self)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.fetchPokemonNames()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PokemonHomeScreenTableViewCell.tableViewNib(), forCellReuseIdentifier: TableViewIdentifiers.homeScreenIdentifier)
    }
}

extension PokemonHomeScreenViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfNames
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewIdentifiers.homeScreenIdentifier, for: indexPath)
        let pokemon = viewModel.results[indexPath.row]
        cell.textLabel?.text = pokemon.name
        
        if let imageUrlString = viewModel.githubImageURL(for: indexPath.row),
           let imageUrl = URL(string: imageUrlString) {
            cell.imageView?.loadImage(from: imageUrl)

        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
extension PokemonHomeScreenViewController: ViewModelDelegate {
    func reloadView() {
        self.tableView.reloadData()
    }
    func show(error: String) {
        print(error)
    }
}

