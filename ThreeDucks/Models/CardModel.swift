//
//  CardModel.swift
//  ThreeDucks
//
//  Created by Andrew Le Nguyen on 13/08/2022.
//

import Foundation

struct CardModel: Identifiable {
  // id to identify each card
  let id: UUID
    
  // animal that the card contains
  let animal: AnimalModel
    
  // if the card has been flipped / clicked
  let isFlipped: Bool

  init(id: UUID = UUID(), animal: AnimalModel, isFlipped: Bool = false) {
    self.id = id
    self.animal = animal
    self.isFlipped = isFlipped
  }
}
