//
//  pokeMonDetailsScreenRepository.swift
//  AssesmentPoke
//
//  Created by Kiasha Rangasamy on 2024/07/25.
//

import Foundation

typealias PokemonDetailsScreenResult = (Result<PokemonDetailsModel, APIError>) -> Void

protocol PokemonDetailsRepositoryType: AnyObject {
    func fetchPokemonDetails(completion: @escaping PokemonDetailsScreenResult)
}

class PokemonDetailsScreenRepository: PokemonDetailsRepositoryType {
    private let apiHandler = APIHandler()
    
    func fetchPokemonDetails(completion: @escaping PokemonDetailsScreenResult) {
        apiHandler.request(endpoint: Endpoint.pokeMonSpecies, method: "GET", completion: completion)
    }
}
