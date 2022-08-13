//
//  ThreeDucksStore.swift
//  ThreeDucks
//
//  Created by Andrew Le Nguyen on 12/08/2022.
//

import Foundation

// alias for clearer context when using this class
typealias ThreeDucksStore = Store<ThreeDucksState>

class Store<ThreeDucksState>: ObservableObject {
    // private(set) = setter is private, because only allow to update this through Reduc
    @Published private(set) var state: ThreeDucksState
    
    init(initialState: ThreeDucksState) {
        self.state = initialState
    }
}
