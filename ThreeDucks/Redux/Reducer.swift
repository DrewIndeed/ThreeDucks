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
    case .endGame:
        mutatingState.gameState = .title
    }
    
    // return newly updated state
    return mutatingState
}
