//
//  TitleScreenView.swift
//  ThreeDucks
//
//  Created by Andrew Le Nguyen on 12/08/2022.
//

import SwiftUI

struct TitleScreenView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 32) {
            Spacer()
            
            Image("title")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Button("New Game") {
                // action
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .background(Color.purple)
            .cornerRadius(40)
            
            Spacer()
            
            HStack(alignment: .center, spacing: 16) {
                ForEach(DifficultyLevel.allCases) { level in
                    Button {
                        // action
                    } label: {
                        Label(level.rawValue, systemImage: "rectangle.portrait")
                    }
                    .foregroundColor(level.color)
                    .padding()
                }
            }
        }
    }
}

struct TitleScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TitleScreenView()
    }
}
