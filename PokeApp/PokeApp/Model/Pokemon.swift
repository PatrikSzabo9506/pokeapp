//
//  Pokemon.swift
//  PokeApp
//
//  Created by Szabo Patrik on 2022. 07. 12..
//

import Foundation


struct Pokemon:Codable{
    var results: [PokemonEntry]

}

struct PokemonEntry:Codable,Identifiable{
    let id = UUID()
    let name: String
    let url: String
}


struct PokemonSelected:Codable{
    let sprites: PokemonSprites
    let weight: Int
}

struct PokemonSprites:Codable{
    var front_default: String
}
