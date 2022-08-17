//
//  Middleware.swift
//  ThreeDucks
//
//  Created by Andrew Le Nguyen on 17/08/2022.
//

/*
 If a reducer that respects the Redux vibe shouldn't allow side effects, randomness or calls
 to external functions, what do you do when you need to cause side effects, add randomness
 or call external functions? In the Redux world, you add a middleware.
 */

/*
 A middleware is a closure that takes a state value and an action,
 then returns a Combine publisher that will output an action
 */

/*
 Middleware needs to be flexible. Sometimes you need middleware to perform a task but return nothing,
 and sometimes it must perform a task asynchronously and return eventually.
 Using a Combine publisher takes care of all that
 */

/*
 If your middleware needs to cause an effect on the state, it should return an action you can dispatch to the store.
 */

import Foundation
import Combine

typealias Middleware<State, Action> = (State, Action) -> AnyPublisher<Action, Never>

let gameLogic: Middleware<ThreeDucksState, ThreeDucksAction> = { state, action in
    switch action {
    case .flipCard: // INTERCEPT every "flipCard" ACTION
        // CHECK IF HAS WON
        // 1. array of flipped cards
        let flippedCards = state.cards.filter { $0.isFlipped }
        // 2. if number of flipped cards = number of total cards
        if flippedCards.count == state.cards.count {
          // send action
          return Just(.winGame)
            .delay(for: 1, scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
        }
        
        let selectedCards = state.selectedCards
        
        // 1. check if the number of selected cards is 2
        if selectedCards.count == 2 {
            // if the cards match
            if selectedCards[0].animal == selectedCards[1].animal {
                // send action
                return Just(.clearSelectedCards)
                    .eraseToAnyPublisher()
            } else {
                // send action
                return Just(.unFlipSelectedCards)
                // need this line bc: If you get a match, you'll see the flipped cards stay flipped.
                // Unfortunately, you'll also notice that if they don't match,
                // they unflip so fast you don't get to see the second card
                    .delay(for: 1, scheduler: DispatchQueue.main)
                    .eraseToAnyPublisher()
            }
        }
        
    default:
        break
    }
    
    // At the moment, it returns an empty publisher. This is how you implement returning nothing as a publisher.
    return Empty().eraseToAnyPublisher()
}
