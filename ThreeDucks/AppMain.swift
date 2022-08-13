//
//  ThreeDucksApp.swift
//  ThreeDucks
//
//  Created by Andrew Le Nguyen on 12/08/2022.
//

import SwiftUI

@main
struct AppMain: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(
                    ThreeDucksStore(
                        initialState: ThreeDucksState()
                    )
                )
        }
    }
}
