//
//  ContentView.swift
//  ThreeDucks
//
//  Created by Andrew Le Nguyen on 12/08/2022.
//

import SwiftUI

struct ContentView: View {
    // (Redux) store as an environment object to be able to update
    @EnvironmentObject var store: ThreeDucksStore
    
    // render screens depending on game (Redux) state
    var body: some View {
        switch store.state.gameState {
        case .title:
            TitleScreenView()
        case .started:
            GameScreenView()
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
