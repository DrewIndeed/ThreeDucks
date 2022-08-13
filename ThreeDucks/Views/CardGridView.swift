//
//  CardGridView.swift
//  ThreeDucks
//
//  Created by Andrew Le Nguyen on 13/08/2022.
//

import SwiftUI

struct CardGridView: View {
    var cards: [CardModel]
    private let columns = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]
    var body: some View {
        LazyVGrid(columns: columns, alignment: .center, spacing: 4, pinnedViews: []) {
            ForEach(cards) { card in
                CardView(card: card)
                    .frame(width: nil, height: 80)
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
