//
//  pokeMonHomeScreenViewModel.swift
//  AssesmentPoke
//
//  Created by Kiasha Rangasamy on 2024/07/23.
//

import Foundation

class pokeMonHomeScreenViewModel {
    
    var pokeMonHome: [pokeMonHomeModel]
    private let repository: pokeMonHomeRepositoryType
    private weak var delegate: ViewModelDelegate
    
    
    init(repository: pokeMonHomeRepositoryType, delegate: ViewModelDelegate) {
        self.pokeMonHome = []
        self.delegate = delegate
        self.repository = repository
    }
        
    func fetchPokeMon() {
        repository.fetchPokeMon { [weak self] result in
            switch result {
            case .success (let fetchPokeMon):
                self?.pokeMonHome
                print(fetchPokeMon)
                self?.delegate?.reloadView()
            case .failure (let error):
                print("Oops! An error occured")
            }
        }
    }
}



