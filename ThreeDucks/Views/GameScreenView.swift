//
//  GameScreenView.swift
//  ThreeDucks
//
//  Created by Andrew Le Nguyen on 13/08/2022.
//

import SwiftUI

struct GameScreenView: View {
    let cards = [
        CardModel(animal: .bat),
        CardModel(animal: .bat),
        CardModel(animal: .ducks),
        CardModel(animal: .ducks),
        CardModel(animal: .bear),
        CardModel(animal: .bear),
        CardModel(animal: .pelican),
        CardModel(animal: .pelican),
        CardModel(animal: .horse),
        CardModel(animal: .horse),
        CardModel(animal: .elephant),
        CardModel(animal: .elephant)
    ].shuffled()
    
    var body: some View {
        VStack(alignment: .leading) {
            // give up button
            Button {
                // Action
            } label: {
                HStack {
                    Image(systemName: "hand.point.left.fill")
                    Text("Give Up")
                }
                .foregroundColor(.purple)
            }
            .padding()
            
            // cards grid
            Spacer()
            CardGridView(cards: cards)
                .padding(8)
            
            // move count
            Spacer()
            Text("Moves: 0")
                .font(.subheadline)
                .foregroundColor(.purple)
                .padding()
        }
    }
}

struct GameScreenView_Previews: PreviewProvider {
    static var previews: some View {
        GameScreenView()
    }
}
