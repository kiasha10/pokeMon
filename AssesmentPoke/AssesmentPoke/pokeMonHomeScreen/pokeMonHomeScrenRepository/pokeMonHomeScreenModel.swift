//
//  pokeMonHomeScreenModel.swift
//  AssesmentPoke
//
//  Created by Kiasha Rangasamy on 2024/07/23.
//

import Foundation

struct pokeMonHomeModel : Codable {
    
    let results: [results]
}

struct results: Codable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}
