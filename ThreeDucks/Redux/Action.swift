//
//  Action.swift
//  ThreeDucks
//
//  Created by Andrew Le Nguyen on 13/08/2022.
//

import Foundation

enum Action {}

enum ThreeDucksAction {
    case startGame
    case endGame
    case winGame
    case flipCard(UUID)
    case clearSelectedCards
    case unFlipSelectedCards
}
