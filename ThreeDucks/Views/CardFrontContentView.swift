//
//  CardFrontContentView.swift
//  ThreeDucks
//
//  Created by Andrew Le Nguyen on 13/08/2022.
//

import SwiftUI

struct CardFrontContentView: View {
    var animal: AnimalModel
    
    var body: some View {
        animal.image
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct CardFrontContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardFrontContentView(animal: .monkey)
    }
}
