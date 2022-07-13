//
//  ContentView.swift
//  PokeApp
//
//  Created by Szabo Patrik on 2022. 07. 12..
//

import SwiftUI

struct ContentView: View {
   @State var pokemonEntry = [PokemonEntry]()
    @State var filteredEntry = ""
    
    
    
    var body: some View {

        NavigationView {
            List {
                ForEach(filteredEntry == "" ? pokemonEntry : pokemonEntry.filter({$0.name.contains(filteredEntry.lowercased())})){pokemon in
                    
                    
                    HStack {
                        Text(pokemon.name)
                        Spacer()
                        ListCellView(imageLink: pokemon.url,name: pokemon.name)
  
                    }
                }
            }
            .onAppear{
                NetworkManager().getData() {pokemon in
                    
                    self.pokemonEntry = pokemon
                }
            }
            .searchable(text: $filteredEntry)
            .navigationTitle("PokeCodex")
        }
        
        
   
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
