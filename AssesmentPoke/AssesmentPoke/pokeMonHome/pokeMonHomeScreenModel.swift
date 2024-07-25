//
//  pokeMonHomeScreenModel.swift
//  AssesmentPoke
//
//  Created by Kiasha Rangasamy on 2024/07/23.
//

import Foundation

struct PokemonHomeModel : Codable {
    let count: Int
    let previous: String?
    let next: String?
    let results: [PokemonResult]
}

struct PokemonResult: Codable {
    let name: String
    let url: String

}
