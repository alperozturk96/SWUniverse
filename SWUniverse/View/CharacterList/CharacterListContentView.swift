//
//  PersonListContentView.swift
//  SWUniverse
//
//  Created by Alper Öztürk on 12.02.2022.
//

import SwiftUI

struct CharacterListContentView: View {
    var character:Character
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        HStack {
            Text(character.name ?? "")
                .font(.body)
            
            if favorites.isFavorite(character.name ?? "") {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
            }
        }
        .modifier(Modifier())
    }
}

struct PersonListContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CharacterListContentView(character: CharacterPreviewData.desann)
        }
        .environmentObject(Favorites())
       
    }
}

fileprivate struct Modifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .preferredColorScheme(.dark)
            .scaledToFit()
            .contentShape(Rectangle()) // Shape of HStack
            .padding(EdgeInsets(top: 17, leading: 21, bottom: 17, trailing: 21))
    }
}
