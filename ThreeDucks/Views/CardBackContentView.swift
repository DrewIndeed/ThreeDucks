//
//  CardBackContentView.swift
//  ThreeDucks
//
//  Created by Andrew Le Nguyen on 13/08/2022.
//

import SwiftUI

struct CardBackContentView: View {
    var body: some View {
        Image("card-back")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct CardBackContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardBackContentView()
    }
}

