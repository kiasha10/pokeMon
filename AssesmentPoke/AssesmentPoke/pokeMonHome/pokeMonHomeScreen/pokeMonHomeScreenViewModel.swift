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
    
    private func extractPokemonID(from url: String) -> String? {
        let components = url.split(separator: "/")
        return components.count > 1 ?
        String(components[components.count - 2]) : nil
    }
    
    private func constructGitHubImageURL(with pokemonID: String) -> String {
//        print("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemonID).png")
        return "https://github.com/PokeAPI/sprites/blob/master/sprites/pokemon/\(pokemonID).png"
    }
    func githubImageURL(for index: Int) -> String? {
        guard index < results.count else { return nil }
        let pokemon = results[index]
        if let pokemonID = extractPokemonID(from: pokemon.url)
        {
            print(pokemonID)
            return constructGitHubImageURL(with: pokemonID)
        }
        return nil
    }
}



