//
//  ThreeDucksStore.swift
//  ThreeDucks
//
//  Created by Andrew Le Nguyen on 12/08/2022.
//

import Foundation

// using Store class with ThreeDucks context
typealias ThreeDucksStore = Store<ThreeDucksState, ThreeDucksAction>

class Store<State, Action>: ObservableObject {
    // private(set) = setter is private, because only allow to update this through Reduc
    @Published private(set) var state: ThreeDucksState
    
    init(initialState: ThreeDucksState) {
        self.state = initialState
    }
}
