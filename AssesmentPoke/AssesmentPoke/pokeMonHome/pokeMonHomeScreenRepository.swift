//
//  pokeMonHomeScreenRepository.swift
//  AssesmentPoke
//
//  Created by Kiasha Rangasamy on 2024/07/23.
//

import Foundation

typealias pokeMonHomeScreenResult = (Result<[pokeMonHomeModel], APIError>) -> Void

protocol pokeMonHomeRepositoryType: AnyObject {
    func fetchpokeMonNames(completeion: @escaping pokeMonHomeScreenResult)
}

class pokeMonHomeScreenRepository: pokeMonHomeRepositoryType {
    func fetchpokeMonNames(completeion: @escaping pokeMonHomeScreenResult) {
        
    }
    private let apiHandler = APIHandler()
    
    func fetchfetchPokeMon(completeion: @escaping pokeMonHomeScreenResult) {
        apiHandler.request(endpoint: Endpoint.pokeMonNames, method: "GET", completion: completeion)
    }
}
