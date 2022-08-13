//
//  ContentView.swift
//  ThreeDucks
//
//  Created by Andrew Le Nguyen on 12/08/2022.
//

import SwiftUI

struct ContentView: View {
    // (Redux) store as an environment object
    @EnvironmentObject var store: ThreeDucksStore
    
    var body: some View {
        switch store.state.gameState {
        case .title:
            TitleScreenView()
        case .started:
            Text("Game Screen")
        case .won:
            Text("Won Screen")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(
            ThreeDucksStore(
                initialState: ThreeDucksState()
            )
        )
    }
}
