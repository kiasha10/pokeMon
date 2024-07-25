//
//  pokeMonHomeScreenRepository.swift
//  AssesmentPoke
//
//  Created by Kiasha Rangasamy on 2024/07/23.
//

import Foundation

typealias PokemonHomeScreenResult = (Result<PokemonHomeModel, APIError>) -> Void

protocol PokemonHomeRepositoryType: AnyObject {
    func fetchPokemonNames(completeion: @escaping PokemonHomeScreenResult)
}

class PokemonHomeScreenRepository: PokemonHomeRepositoryType {
    private let apiHandler = APIHandler()
    
    func fetchPokemonNames(completeion: @escaping PokemonHomeScreenResult) {
        apiHandler.request(endpoint: Endpoint.pokemonNames, method: "GET", completion: completeion)
    }
}

