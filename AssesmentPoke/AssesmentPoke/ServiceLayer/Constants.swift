//
//  Constants.swift
//  AssesmentPoke
//
//  Created by Kiasha Rangasamy on 2024/07/23.
//

import Foundation

struct Endpoint {
    
    static let pokeMonNames = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=100"
    
    static let pokeMonAbililties = "https://pokeapi.co/api/v2/ability/1/"
    static let pokeMonGenders = "https://pokeapi.co/api/v2/gender/1/"
    static let pokeMonSpecies = "https://pokeapi.co/api/v2/pokemon-species/1/"
}

struct TableViewIdentifiers {
    static let homeScreenIdentifier = "PokeMonTableViewCell"
}

struct UINibIdentifiers {
    static let homeScreen = "homeScreenIdentifier"
}
