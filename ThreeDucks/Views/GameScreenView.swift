//
//  GameScreenView.swift
//  ThreeDucks
//
//  Created by Andrew Le Nguyen on 13/08/2022.
//

import SwiftUI

struct GameScreenView: View {
    // (Redux) store to use Redux mechanism
    @EnvironmentObject var store: ThreeDucksStore
    
    var body: some View {
        VStack(alignment: .leading) {
            // give up button
            Button {
                // Action
                store.dispatchToQueueActions(.endGame)
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
            // adjust to read the cards from the store instead of the view local data
            CardGridView(cards: store.state.cards)
                .padding(8)
            
            // move count
            Spacer()
            Text("Moves: \(store.state.moves)")
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
