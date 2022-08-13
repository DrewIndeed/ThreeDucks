//
//  CardGridView.swift
//  ThreeDucks
//
//  Created by Andrew Le Nguyen on 13/08/2022.
//

import SwiftUI

struct CardGridView: View {
    // array of cards
    var cards: [CardModel]
    
    // three columns of card grid
    private let columns = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]
    
    // use LazyGrid since there will be more card if the game is more difficult
    var body: some View {
        LazyVGrid(columns: columns,
                  alignment: .center,
                  spacing: 4,
                  pinnedViews: []
        ) {
            ForEach(cards) { card in
                CardView(card: card)
                    .frame(width: 100, height: 120)
            }
        }
    }
}

struct CardGridView_Previews: PreviewProvider {
    static var previews: some View {
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
        CardGridView(cards: cards)
    }
}
