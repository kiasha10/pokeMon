//
//  pokeMonDetailsScreenViewController.swift
//  AssesmentPoke
//
//  Created by Kiasha Rangasamy on 2024/07/25.
//

import UIKit

class PokemonDetailsScreenViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private lazy var viewModel = PokemonDetailsScreenViewModel (repository: PokemonDetailsScreenRepository(), delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.fetchTypesOfSpecies()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PokenmonDetailsScreenTableViewCell.tableViewNib(), forCellReuseIdentifier: TableViewIdentifiers.detailsScreenIdentifier)
    }
}

extension PokemonDetailsScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.species
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewIdentifiers.detailsScreenIdentifier, for: indexPath)
        let statistics = viewModel.details[indexPath.row]
        cell.textLabel?.text = statistics.name

        if let imageUrlString = viewModel.githubImageURL(for: indexPath.row),
           let imageUrl = URL(string: imageUrlString) {
            cell.imageView?.loadImage(from: imageUrl)

        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}

extension PokemonDetailsScreenViewController: ViewModelDelegate {
    func reloadView() {
        self.tableView.reloadData()
    }
    func show(error: String) {
        print(error)
    }
}
