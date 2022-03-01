//
//  FavoriteView.swift
//  SWUniverse
//
//  Created by Alper Öztürk on 1.03.2022.
//

import SwiftUI

struct FavoriteView: View {
    var isFavorite:Bool

    init(_ isFavorite:Bool){
        self.isFavorite = isFavorite
    }

    var body: some View {
        Image(systemName: "heart.fill")
            .foregroundColor(isFavorite ? .red : .white)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView(true)
    }
}
