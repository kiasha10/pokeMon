//
//  pokeMonDetailsScreenViewModel.swift
//  AssesmentPoke
//
//  Created by Kiasha Rangasamy on 2024/07/25.
//

import Foundation

class PokemonDetailsScreenViewModel {
    
    var details: [Color] = []
    private let repository: PokemonDetailsRepositoryType
    private weak var delegate: ViewModelDelegate?
    
    init(repository: PokemonDetailsRepositoryType, delegate: ViewModelDelegate) {
        self.repository = repository
        self.delegate = delegate
    }
    
    var species: Int {
        return details.count
    }
    
    func typesOfSpecies(atIndex index: Int) -> Color {
        return details[index]
    }
    
    func fetchTypesOfSpecies() {
        repository.fetchPokemonDetails { [weak self] result in
            switch result {
            case .success(let fetchPokemonDetails):
                self?.details = fetchPokemonDetails.eggGroups
                self?.delegate?.reloadView()
            case .failure(let error):
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
        return "https://github.com/PokeAPI/sprites/blob/master/sprites/pokemon/\(pokemonID).png"
    }
    func githubImageURL(for index: Int) -> String? {
        guard index < details.count else { return nil }
        let pokemon = details[index]
        if let pokemonID = extractPokemonID(from: pokemon.url)
        {
            print(pokemonID)
            return constructGitHubImageURL(with: pokemonID)
        }
        return nil
    }
}
