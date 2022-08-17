//
//  ThreeDucksState.swift
//  ThreeDucks
//
//  Created by Andrew Le Nguyen on 12/08/2022.
//

import Foundation

struct State {}

struct ThreeDucksState{
    var gameState: GameState = .title
    var cards: [CardModel] = []
    
    var selectedCards: [CardModel] = []
    var moves: Int = 0
}
