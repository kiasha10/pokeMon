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

class PokemonHomeScreenViewModel {
    
    var results: [PokemonResult] = []
    private let repository: PokemonHomeRepositoryType
    private weak var delegate: ViewModelDelegate?
    
    
    init(repository: PokemonHomeRepositoryType, delegate: ViewModelDelegate) {
        self.delegate = delegate
        self.repository = repository
    }
    
    var numberOfNames: Int {
        return results.count
    }
    
    func pokeMonNames(atIndex index: Int) -> PokemonResult {
        return results[index]
    }
        
    func fetchPokemonNames() {
        repository.fetchPokemonNames { [weak self] result in
            switch result {
            case .success (let fetchPokemonNames):
                self?.results = fetchPokemonNames.results
                print("\(fetchPokemonNames)")
                self?.delegate?.reloadView()
            case .failure (let error):
                print("Oops! An error occured")
                self?.delegate?.show(error: error.rawValue)
            }
        }
    }
}



