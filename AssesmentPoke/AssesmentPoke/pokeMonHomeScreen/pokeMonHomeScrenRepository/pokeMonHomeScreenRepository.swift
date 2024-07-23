//
//  pokeMonHomeScreenRepository.swift
//  AssesmentPoke
//
//  Created by Kiasha Rangasamy on 2024/07/23.
//

import Foundation

typealias pokeMonHomeResult = (Result<[pokeMonHomeModel], APIError>) -> Void

protocol pokeMonHomeRepositoryType: AnyObject {
    func fetchfetchPokeMon(completeion: @escaping pokeMonHomeResult)
}

class pokeMonHomeRepository: pokeMonHomeRepositoryType {
    
    private let apiHandler = APIHandler()
    
    func fetchfetchPokeMon(completeion: @escaping pokeMonHomeResult) {
        apiHandler.request(endpoint: String, method: "GET", completeion: completeion)
    }
}
