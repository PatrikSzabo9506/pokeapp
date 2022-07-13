//
//  NetworkManager.swift
//  PokeApp
//
//  Created by Szabo Patrik on 2022. 07. 12..
//

// String for the API : https://pokeapi.co/api/v2/pokemon

import Foundation


class NetworkManager{
    
    func getData(completion: @escaping([PokemonEntry]) -> Void){
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=100")
        else{return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil else {return}
            
            
            let pokemonList = try! JSONDecoder().decode(Pokemon.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonList.results)
            }//Dispatch
            
        }.resume()
    }
    
    
    func getSelectedPokemon(url:String,completion: @escaping(PokemonSprites) -> ()){
        
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {return}
            
            let pokemonScriptes = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            DispatchQueue.main.async {
                completion(pokemonScriptes.sprites)
            }
            
        }.resume()
        
    }
}
