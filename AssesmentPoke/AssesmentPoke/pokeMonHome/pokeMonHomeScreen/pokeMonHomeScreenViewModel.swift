//
//  pokeMonHomeScreenViewModel.swift
//  AssesmentPoke
//
//  Created by Kiasha Rangasamy on 2024/07/23.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func reloadView()
    func show(error: String)
}

class pokeMonHomeScreenViewModel {
    
    var results: [pokeMonHomeModel]
    private let repository: pokeMonHomeRepositoryType
    private weak var delegate: ViewModelDelegate?
    
    
    init(repository: pokeMonHomeRepositoryType, delegate: ViewModelDelegate) {
        self.results = []
        self.delegate = delegate
        self.repository = repository
    }
    
    var numberOfNames: Int {
        results.count
    }
    
    func pokeMonNames(atIndex: Int) -> pokeMonHomeModel {
        results[atIndex]
    }
        
    func fetchpokeMonNames() {
        repository.fetchpokeMonNames { [weak self] result in
            switch result {
            case .success (let fetchpokeMonNames):
                self?.results = fetchpokeMonNames
                print("\(fetchpokeMonNames)")
                self?.delegate?.reloadView()
            case .failure (let error):
                print("Oops! An error occured")
                self?.delegate?.show(error: error.rawValue)
                
            }
        }
    }
}



