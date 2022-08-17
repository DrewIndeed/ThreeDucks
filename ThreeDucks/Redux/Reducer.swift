//
//  Reducer.swift
//  ThreeDucks
//
//  Created by Andrew Le Nguyen on 13/08/2022.
//

import Foundation

typealias Reducer<State, Action> = (State, Action) -> State

let threeDucksReducer: Reducer<ThreeDucksState, ThreeDucksAction> = { state, action in
    // mutable copy of the current state (Redux's way to change the state)
    var mutatingState = state
    
    // change the state depending on action requests
    // more action, more cases
    switch action {
    case .startGame:
        mutatingState.gameState = .started
        
        // init the default cards
        mutatingState.cards = [
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
        
        // reset selected cards and move count
        mutatingState.selectedCards = []
        mutatingState.moves = 0
        
    case .endGame:
        mutatingState.gameState = .title
        
    case .flipCard(let id):
        // 1. make sure there are 2 cards selected at a time
        guard mutatingState.selectedCards.count < 2 else {break}
        
        // 2. prevent counting mulitple taps on the same card - notice the !
        guard !mutatingState.selectedCards.contains(where: {$0.id == id}) else {break}
        
        // GET THE INDEX OF THE TAPPED CARD
        // 3. make a copy of the cards from the state
        var mutatingCards = mutatingState.cards
        // 4. make sure to find the index of the flipped card
        guard let selectedIndex = mutatingCards.firstIndex(where: {$0.id == id}) else {break}
        
        // USE THE INDEX OF THE TAPPED CARD TO CHANGE ITS FLIPPED STATE TO TRUE
        // 5. make a copy to get the info of the selected card
        let selectedCard = mutatingCards[selectedIndex]
        // 6. use the copy info in create a new (selected) card instance with isFlipped = true
        let flippedCard = CardModel(
            id: selectedCard.id,
            animal: selectedCard.animal,
            isFlipped: true)
        //mutatingCards7. insert the just-flipped card into the cards at the right index that it is tapped
        mutatingCards[selectedIndex] = flippedCard
        
        // APPEND THE SELECTED CARD IN STATE ARRAY OF SELECTED CARDS
        mutatingState.selectedCards.append(selectedCard)
        
        // UPDATE THE OVERALL CARDS ARRAY OF THE STATE AS THE NEWLY UPDATED ARRAY WITH A FLIPPED CARD
        mutatingState.cards = mutatingCards
        
        // INCREMENT MOVE
        mutatingState.moves += 1
        
    case .unFlipSelectedCards:
        // 1. array of ids of the selected cards
        let selectedIDs = mutatingState.selectedCards.map { $0.id }
        
        // 2. array of all cards
        let cards: [CardModel] = mutatingState.cards.map { card in
            // 2.1 if the target card's id is in selectedIDs array
            guard selectedIDs.contains(card.id) else {return card}
            
            // 2.2 get the info, make a copy, set isFlipped back to false
            return CardModel(id: card.id, animal: card.animal, isFlipped: false)
        }
        
        // empty selected cards array
        mutatingState.selectedCards = []
        
        // set state cards array as the updated one
        mutatingState.cards = cards
        
    case .clearSelectedCards:
        // empty selected cards array
        mutatingState.selectedCards = []
    }
    
    // return newly updated state
    return mutatingState
}
