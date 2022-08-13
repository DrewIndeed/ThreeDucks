//
//  CardView.swift
//  ThreeDucks
//
//  Created by Andrew Le Nguyen on 13/08/2022.
//

import SwiftUI

struct CardView: View {
    var card: CardModel
    
    var body: some View {
        ZStack(
            alignment: Alignment(horizontal: .center, vertical: .center)
        ) {
            // card background
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(card.isFlipped && card.animal == .ducks ? Color.purple : Color.black)
            
            // show card back if card is flipped
            if card.isFlipped {
                CardFrontContentView(animal: card.animal)
                    .padding()
            } else {
                CardBackContentView()
                    .padding()
            }
        }
        // animation
        .rotation3DEffect(
            card.isFlipped ?
            Angle(degrees: 180)
            : Angle(degrees: 0), axis: (x: 0, y: 10, z: 0))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: CardModel(animal: .owl, isFlipped: false))
        CardView(card: CardModel(animal: .owl, isFlipped: true))
        CardView(card: CardModel(animal: .ducks, isFlipped: true))
    }
}

