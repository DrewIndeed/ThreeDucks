//
//  Reducer.swift
//  ThreeDucks
//
//  Created by Andrew Le Nguyen on 13/08/2022.
//

import Foundation

typealias Reducer<State, Action> = (State, Action) -> State

let threeDucksReducer: Reducer<ThreeDucksState, ThreeDucksAction> = { state, action in
    return state
}
