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
    // private(set) = setter is private, because only allow to update this through Redux
    @Published private(set) var state: ThreeDucksState
    private let reducer: Reducer<ThreeDucksState, ThreeDucksAction>
    
    // internal work of the store for dispatching actions
    private func dispatchToUpdateState(_ currentState: ThreeDucksState, _ action: ThreeDucksAction) {
        // generate a new state using the reducer
        let newState = reducer(currentState, action)
        
        // update the store's state to the new state
        state = newState
    }
    
    // using DispatchQueue to make sure that the DISPATCHING tasks are done synchronously
    // aka a serial Queue
    private let queue = DispatchQueue(
        // just a label to unique define this queue
        label: "com.DrewIndeed.ThreeDucks.store",
        // Quality of Service as userInitiated: for tasks that provide immediate results
        // for something user is doing. Read more from Apple Dev Doc
        qos: .userInitiated
    )
    
    // queue up the actions that are dispatched to update the state
    func dispatchToQueueActions(_ action: ThreeDucksAction) {
        queue.sync {
            self.dispatchToUpdateState(self.state, action)
        }
    }
    
    init(
        initialState: ThreeDucksState,
        // @escaping because Reducer will go out of scope when called
        initialReducer: @escaping Reducer<ThreeDucksState, ThreeDucksAction>
    ) {
        self.state = initialState
        self.reducer = initialReducer
    }
}
