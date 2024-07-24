//
//  pokeMonHomeScreenViewController.swift
//  AssesmentPoke
//
//  Created by Kiasha Rangasamy on 2024/07/23.
//

import UIKit

class pokeMonHomeScreenViewController: UIViewController {

// MARK: IB Oulets
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var spinner: UIActivityIndicatorView!
    
    private lazy var viewModel = pokeMonHomeScreenViewModel (repository: pokeMonHomeScreenRepository(), delegate: self)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.fetchpokeMonNames()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(pokeMonHomeScreenTableViewCell.tableViewNib(), forCellReuseIdentifier: TableViewIdentifiers.homeScreenIdentifier)
    }
}

extension pokeMonHomeScreenViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfNames
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewIdentifiers.homeScreenIdentifier) as? pokeMonHomeScreenTableViewCell
        else {
            return UITableViewCell()
        }
        let pokeMon = viewModel.results[indexPath.row]
        cell.configure(pokeMonNames: pokeMon)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}

extension pokeMonHomeScreenViewController: ViewModelDelegate {
    func reloadView() {
        self.tableView.reloadData()
        self.spinner.isHidden = true
    }
    func show(error: String) {
        print(error)
    }
}
