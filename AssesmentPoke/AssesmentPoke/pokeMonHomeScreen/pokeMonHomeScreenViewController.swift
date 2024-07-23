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
    
    private lazy var viewModel = pokeMonHomeScreenViewModel (repository: pokeMonHomeRepository, delegate: self)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchPokeMon()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier: <#T##String#>)
    }
}

extension pokeMonHomeScreenViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.pokeMonHome()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pokeMonCard") as? pokeMonHomeScreenTableViewCell
        else {
            return UITableViewCell()
        }
        let fetchPokeMon = viewModel.pokeMonHome[indexPath.row]
        cell.configure(pokeMonHome: fetchPokeMon)
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
}
