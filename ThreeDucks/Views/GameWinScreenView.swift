//
//  GameWinScreenView.swift
//  ThreeDucks
//
//  Created by Andrew Le Nguyen on 17/08/2022.
//

import SwiftUI

struct GameWinScreenView: View {
    @EnvironmentObject var store: ThreeDucksStore
    
    var body: some View {
        VStack(alignment: .center, spacing: 32) {
            Spacer()
            Text("Well Done!")
                .font(.title)
                .foregroundColor(.white)
            
            Image("ducks")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Button("Go Again") {
                // Action
                store.dispatchToQueueActions(.endGame)
            }
            .font(.headline)
            .foregroundColor(.purple)
            .padding()
            .background(Color.white)
            .cornerRadius(40)
            
            Spacer()
        }
        .background(Color.purple)
    }
}

struct GameWinScreenView_Previews: PreviewProvider {
    static var previews: some View {
        GameWinScreenView()
    }
}
