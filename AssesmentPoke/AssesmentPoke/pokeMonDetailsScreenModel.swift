//
//  pokeMonDetailsScreenModel.swift
//  AssesmentPoke
//
//  Created by Kiasha Rangasamy on 2024/07/25.
//

import Foundation

struct PokemonDetailsModel: Codable {
    let color: Color
    let eggGroups: [Color]
    let shape: Color
    
    enum CodingKeys: String, CodingKey {
        case color
        case eggGroups = "egg_groups"
        case shape
    }
}

struct Color: Codable {
    let name: String
    let url: String
}
