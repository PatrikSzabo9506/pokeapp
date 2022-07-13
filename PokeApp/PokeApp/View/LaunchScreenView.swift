//
//  LaunchScreenView.swift
//  PokeApp
//
//  Created by Szabo Patrik on 2022. 07. 13..
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        ZStack{
            
            Image("landscape")
                .edgesIgnoringSafeArea(.all)
            
            
                Image("pokemon-logo")
                    .resizable()
                    .frame(maxWidth:200,maxHeight: 200)

        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
