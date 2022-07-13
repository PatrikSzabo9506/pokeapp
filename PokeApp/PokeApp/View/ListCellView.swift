//
//  ListCellView.swift
//  PokeApp
//
//  Created by Szabo Patrik on 2022. 07. 12..
//

import SwiftUI

struct ListCellView: View {
    var imageLink = ""
    @State private var  pokemonSprite = ""
    @State private var isFavorite = false
    var name: String
    var body: some View {
    
        HStack {
            AsyncImage(url:URL(string: pokemonSprite))
                    .frame(maxWidth:150,maxHeight: 150)
                    .onAppear{
                        let loadedData = UserDefaults.standard.string(forKey: imageLink)
                        
                        if loadedData == nil {
                            getImage(url: imageLink)
                            UserDefaults.standard.set(imageLink, forKey: imageLink)
                            
                        }
                        else{
                            getImage(url: loadedData!)
                            
                            
                        }
                }
            
            Text(name)
                .font(.title3)
                .bold()
            
            Button {
                isFavorite.toggle()
            } label: {
                Image(isFavorite ? "star-solid":"star-regular")
                    .resizable()
                    .frame(maxWidth:25,maxHeight:25)
            }
        }
            
    }
    func getImage(url:String) {
        var tempSprite: String?
        
        NetworkManager().getSelectedPokemon(url: url){ sprite in
            tempSprite = sprite.front_default
            self.pokemonSprite = tempSprite ?? "placeholder"
            
        }
    }
    
}

struct ListCellView_Previews: PreviewProvider {
    static var previews: some View {
        ListCellView(name: "Balbasaur")
    }
}
